-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- Unmap previous LazyGit mappings and add on for Vim fugitive
keymap("n", "<leader>gg", "<cmd>vert Git<cr>", { desc = "Vim fugitive" })
keymap("n", "<leader>gG", "")
