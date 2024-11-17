return {
	{
		-- Clear current suggestion	codeium#Clear()	<C-]>
		-- Next suggestion	codeium#CycleCompletions(1)	<M-]>
		-- Previous suggestion	codeium#CycleCompletions(-1)	<M-[>
		-- Insert suggestion	codeium#Accept()	<Tab>
		-- Manually trigger suggestion	codeium#Complete()	<M-Bslash>
		-- Accept word from suggestion	codeium#AcceptNextWord()	<C-k>
		-- Accept line from suggestion	codeium#AcceptNextLine()	<C-l>
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		-- This provides the completion function for snippets used by nvim-cmp
		-- below
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			-- completion source for luasnip
			"saadparwaiz1/cmp_luasnip",

			-- snippets collection
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")

			vim.keymap.set({ "i" }, "<S-Tab>", function()
				ls.expand()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- This isn't really needed, as normal C-n triggers completefunc too
					--["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- Accept currently selected item. Set `select` to `false` to only
					-- confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),

				completion = {
					autocomplete = false,
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this
			-- won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this
			-- won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
