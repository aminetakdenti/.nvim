require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- rename
map("n", "<leader>lr", "<leader>ra", { desc = "rename variable" })

-- formating with conform
map("n", "<leader>lf", function()
  print "format"
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "format the current buffer" })

map("n", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "format the current buffer" })

-- rename
map("n", "<leader>lr", function()
  local new_name = vim.fn.input "New name: " -- Prompt the user for a new name
  vim.lsp.buf.rename(new_name)               -- Pass the new name to the rename function
end, { desc = "Rename current variable" })
--
-- Comment line (gcc) and block (gbc)
map("n", "gcc", function()
  return require("Comment.api").toggle.linewise.current()
end, { expr = true, desc = "Toggle line comment" })

map("x", "gc", function()
  return require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { expr = true, desc = "Toggle line comment in visual mode" })

map("n", "gbc", function()
  return require("Comment.api").toggle.blockwise.current()
end, { expr = true, desc = "Toggle block comment" })

map("x", "gb", function()
  return require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, { expr = true, desc = "Toggle block comment in visual mode" })

map("n", "gl", function()
  print(vim.diagnostic.get())
end, { expr = true, desc = "show lined iagnostics" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
