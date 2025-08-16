return {
  {
    "stevearc/conform.nvim",
    config = function()
      local path_utils = require "utils.path"

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          markdown = { "prettierd", "prettier" },
        },
      }

      -- format on save (only outside developatic dir)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          if not path_utils.is_developatic_dir() then
            require("conform").format {
              bufnr = args.buf,
              lsp_fallback = true,
            }
          end
        end,
      })

      -- manual format
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format { async = true, lsp_fallback = true }
      end, { desc = "Format file with Conform" })
    end,
  },
}
