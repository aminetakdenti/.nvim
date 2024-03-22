vim.cmd([[hi Cursor guifg=NONE guibg=gold]])

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<C-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<C-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

vim.opt.colorcolumn = "80"
