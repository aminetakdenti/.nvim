local options = {
  formatters_by_ft = {
    javascript = { "prettier", "eslint" },
    typescript = { "prettier", "eslint" },
    javascriptreact = { "prettier", "eslint" },
    typescriptreact = { "prettier", "eslint" },
    json = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
  },

  log_level = vim.log.levels.DEBUG,
}

return options
