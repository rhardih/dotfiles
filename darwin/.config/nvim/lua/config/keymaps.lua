-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- Unmap previous LazyGit mappings and add on for Vim fugitive
keymap("n", "<leader>gg", "<cmd>vert Git<cr>", { desc = "Vim fugitive" })
keymap("n", "<leader>gG", "")

-- Restore default vim tab navigation
keymap("n", "gt", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "gT", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Remove H & L bindings
for _, key in pairs({
  "<S-h>", -- bprev
  "<S-l>", -- bnext
}) do
  vim.keymap.del("n", key)
end
