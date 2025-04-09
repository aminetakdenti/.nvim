return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = null,
    },
    config = function()
      local path_utils = require 'utils.path'

      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { 'rustfmt', lsp_format = 'fallback' },
          -- Conform will run the first available formatter
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        },
      }

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
          if not path_utils.is_developatic_dir() then
            require('conform').format { bufnr = args.buf }
          end
        end,
      })

      vim.keymap.set('n', '<leader>f', function()
        require('conform').format { async = true, lsp_fallback = true }
      end, { desc = 'Format file with Conform' })
    end,
  },
}
