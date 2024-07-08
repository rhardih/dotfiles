vim.cmd("let g:netrw_liststyle = 3")

-- nvim-cmp
vim.cmd("set completeopt=menu,menuone,noselect")

-- line numbers
vim.wo.relativenumber = true

local opt = vim.opt

-- lsp

-- Avoid the lefthand shoulder bouncing in and out, when a warning or error is
-- returned from the LSP
opt.signcolumn = "yes"

-- tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- folding

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldlevel = 99
-- opt.foldlevelstart = 1
opt.foldnestmax = 4

-- misc.

opt.termguicolors = true
opt.background = "dark"
