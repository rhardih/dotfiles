
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

-- terraform .sql.tpl files render as .sql
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.sql.tpl",
  callback = function()
    vim.bo.filetype = "sql"
  end,
})

require("options")

-- lazy.nvim setup

require("lazy").setup("plugins")
