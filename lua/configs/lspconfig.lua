-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "lua_ls" }
local nvlsp = require "nvchad.configs.lspconfig"


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      if client.server_capabilities.documentFoldingRangeProvider then
        require("ufo").setup()
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    handlers = {
      ["textDocument/foldingRange"] = function(...)
        return require("ufo").lsp_folding_range(...)
      end,
    },
  }
end

-- Optional: Custom configuration for specific servers
lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    tailwindCSS = {
      includeLanguages = {
        html = "html",
        javascript = "javascript",
        javascriptreact = "javascriptreact",
        typescript = "typescript",
        typescriptreact = "typescriptreact",
        css = "css",
        sass = "sass",
        scss = "scss",
      },
    },
  },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
