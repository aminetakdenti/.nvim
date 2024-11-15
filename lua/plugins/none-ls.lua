return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					-- Optionally, you can specify extra settings here if needed
					-- But Prettier will automatically use the local config if it exists
				}),
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.biome,
			},
		})

		-- Key mapping for formatting
		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
