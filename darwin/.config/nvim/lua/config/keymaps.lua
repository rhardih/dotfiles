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

-- LazyVim maps Signature Help to both <c-k> and gK so it makes sense
-- restore default vim binding for inputting digraphs to <c-k>
-- keymap("n", "<c-k>", "", { desc = "Digraphs" })

-- Remove H & L bindings
for _, key in pairs({
  "<S-h>", -- bprev
  "<S-l>", -- bnext
  "<C-K>",
}) do
  vim.keymap.del("n", key)
end

-- vimux
keymap("n", "<leader>vl", ":VimuxRunLastCommand<cr>")
keymap("n", "<leader>vp", ":VimuxPromptCommand<cr>")
keymap("n", "<leader>vq", ":VimuxCloseRunner<cr>")
keymap("n", "<leader>v<C-l>", ":VimuxClearTerminalScreen<cr>")

-- vimux-golang
keymap("n", "<leader>ra", "<cmd>wa<cr> :GolangTestCurrentPackage<cr>")
keymap("n", "<leader>rf", "<cmd>wa<cr> :GolangTestFocused<cr>")
