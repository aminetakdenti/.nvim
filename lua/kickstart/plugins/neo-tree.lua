-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- -- NeoTree background color customizations
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.cmd 'highlight NeoTreeNormal guibg=#000000' -- Modify this to your preferred color
    vim.cmd 'highlight NeoTreeNormalNC guibg=#000000' -- Modify this to your preferred color
    vim.cmd 'highlight NeoTreeEndOfBuffer guibg=#000000' -- Modify this to your preferred color
    vim.cmd 'highlight NeoTreeWinSeparator guibg=#000000 guifg=#222222'
  end,
})

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
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
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
