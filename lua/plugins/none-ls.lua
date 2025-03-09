return {
  "nvimtools/none-ls.nvim",                   -- Use the new none-ls repository
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Add your sources here (linters, formatters, etc.)
        null_ls.builtins.formatting.stylua.with({ -- Customize stylua
          extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
        }),
        null_ls.builtins.formatting.prettier.with({ -- Customize prettier
          filetypes = { "javascript", "typescript", "css", "json" },
          -- Ensure Prettier uses the local config file
          prefer_local = "node_modules/.bin",                       -- Prefer local Prettier installation
          args = { "--config", vim.fn.getcwd() .. "/.prettierrc" }, -- Specify the path to your local Prettier config
        }),
        null_ls.builtins.diagnostics.eslint_d,                      -- Example: ESLint diagnostics
        null_ls.builtins.code_actions.gitsigns,                     -- Example: Git code actions
      },
      on_attach = function(client, bufnr)
        -- Custom on_attach function (optional)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
