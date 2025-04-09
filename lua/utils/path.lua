local M = {}

M.is_developatic_dir = function()
  local cwd = vim.fn.getcwd()
  return string.find(cwd, '/developatic/') ~= nil or string.find(cwd, '/developatic$') ~= nil
end

return M
