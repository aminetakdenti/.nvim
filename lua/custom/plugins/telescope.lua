vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    -- Telescope
    vim.cmd 'highlight TelescopeNormal guibg=#000000'
    vim.cmd 'highlight TelescopeBorder guibg=#000000 guifg=#444444'
    vim.cmd 'highlight TelescopePromptNormal guibg=#000000'
    vim.cmd 'highlight TelescopePromptBorder guibg=#000000 guifg=#444444'
    vim.cmd 'highlight TelescopeResultsNormal guibg=#000000'
    vim.cmd 'highlight TelescopeResultsBorder guibg=#000000 guifg=#444444'
  end,
})

return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    -- { 'nvim-tree/nvim-web-devicons' },
    { 'echasnovski/mini.icons', version = '*' },
  },
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
    require('telescope').setup {

      pickers = {
        find_files = {
          theme = 'ivy',
        },
        layout_config = {
          prompt_position = 'top',
        },
      },
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_ivy(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    vim.keymap.set('n', '<leader>ep', function()
      builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath 'data', 'lazy'),
      }
    end, { desc = '[S]earch [E]dit [P]ackage' })

    -- Set up a keymap to search TODOs
    vim.keymap.set('n', '<leader>st', function()
      require('telescope.builtin').live_grep {
        prompt_title = '🔍 TODOs & FIXMEs',
        grep_open_files = true, -- search in open files first
        search = [[\b(TODO|FIXME|NOTE|OPTIMIZE|HACK|BUG)\b]], -- regex pattern
      }
    end, { desc = 'Find TODOs in code' })

    require('config.telescope.multigrep').setup()
  end,
}
