return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    { 'echasnovski/mini.icons', version = '*' },
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
  opts = {
    filesystem = {
      -- ADD THIS SECTION
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
        ['P'] = {
          'toggle_preview',
          config = {
            use_float = false,
            use_image_nvim = true,
            title = 'Neo-tree Preview',
          },
        },
      },
    },
  },
}
