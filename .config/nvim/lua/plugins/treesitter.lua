-- syntax highlighting: nvim-treesitter
-- Uses the `main` branch, which is the only one supporting Neovim 0.12+.

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup()

    -- Parsers to keep installed. markdown/markdown_inline are required for
    -- LSP hover floats to render without errors.
    local ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "hcl",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "ruby",
      "rust",
      "sql",
      "svelte",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }

    local installed = ts.get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure_installed)
    if #to_install > 0 then
      ts.install(to_install)
    end

    -- Enable highlighting and (experimental) indentation per buffer.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and vim.treesitter.language.add(lang) then
          vim.treesitter.start(args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
