-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- Disable the "Splitjoin working..." message which pops up by default
vim.g.splitjoin_quiet = 1

local opt = vim.opt

opt.foldmethod = "indent"
opt.foldlevel = 8

opt.clipboard = "" -- revert back to default of *not* syncing with system clipboard
