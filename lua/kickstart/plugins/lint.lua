return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local path_utils = require 'utils.path'

      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        javascript = { 'eslint' },
        typescript = { 'eslint' },
        javascriptreact = { 'eslint' },
        typescriptreact = { 'eslint' },
        lua = { 'luacheck' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() and not path_utils.is_developatic_dir() then
            print 'linting is on'
            lint.try_lint()
          else
            if path_utils.is_developatic_dir() then
              print 'linting is off because we are under developatic folder'
            end
          end
        end,
      })
    end,
  },
}
