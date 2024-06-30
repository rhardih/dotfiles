vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("let g:netrw_liststyle = 3")

-- nvim-cmp
vim.cmd("set completeopt=menu,menuone,noselect")

-- line numbers
vim.wo.relativenumber = true

-- lsp

-- Avoid the lefthand shoulder bouncing in and out, when a warning or error is
-- returned from the LSP
vim.cmd("set signcolumn=yes")
