-- linting etc. from cli tools as a language server

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.djlint.with({
          filetypes = { "html", "template" },
          extra_args = { "--indent", "2" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
