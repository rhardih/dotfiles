return {
	{
		-- makes it easy to split and join lines of code with gS and gJ
		"AndrewRadev/splitjoin.vim",
	},
	{
		-- work with surrounding characters easily, ysiw", to surround a word with
		-- " e.g.
		"tpope/vim-surround",
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup()

			vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
			vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
			vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
			vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
		end,
	},
}
