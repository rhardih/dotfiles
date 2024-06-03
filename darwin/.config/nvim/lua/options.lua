vim.cmd("let g:netrw_liststyle = 3")

-- nvim-cmp
vim.cmd("set completeopt=menu,menuone,noselect")

-- line numbers
vim.wo.relativenumber = true

-- lsp

-- Avoid the lefthand shoulder bouncing in and out, when a warning or error is
-- returned from the LSP
vim.cmd("set signcolumn=yes")

local opt = vim.opt

-- tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
