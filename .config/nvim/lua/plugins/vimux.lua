return {
  {
    "benmills/vimux-golang",
    config = function()
      vim.keymap.set("n", "<leader>ra", "<cmd>wa<cr> :GolangTestCurrentPackage<cr>")
      vim.keymap.set("n", "<leader>rf", "<cmd>wa<cr> :GolangTestFocused<cr>")
    end
  },
  {
    "preservim/vimux",
    config = function()
      vim.keymap.set("n", "<leader>vl", ":VimuxRunLastCommand<cr>")
      vim.keymap.set("n", "<leader>vp", ":VimuxPromptCommand<cr>")
      vim.keymap.set("n", "<leader>vq", ":VimuxCloseRunner<cr>")
      vim.keymap.set("n", "<leader>v<C-l>", ":VimuxClearTerminalScreen<cr>")

      vim.g.VimuxHeight = 40 -- Split pane 40%
      vim.g.VimuxOrientation = "h" -- Split to the right instead of to the bottom
    end
  },
}
