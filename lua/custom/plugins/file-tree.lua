return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { 'echasnovski/mini.icons', version = '*' },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()

    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = { "^.DS_Store$", "^.git$" },
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file" })
  end,
}
