vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- package management: lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim setup

require("lazy").setup("plugins")

-- fuzzy file finding: telescope.nvim
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- colorscheme

require("tokyonight").setup({
  style = "night"
})

vim.cmd.colorscheme "tokyonight"

-- syntax highlighting: treesitter-nvim
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua", "javascript", "html" },
  highlight = { enable = true },
  indent = { enable = true },  
})
