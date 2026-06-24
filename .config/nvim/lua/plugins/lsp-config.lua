return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "goimports",
          "gofumpt",
          "shfmt",
          "prettierd",
          "djlint",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- automatically install LSPs
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "gopls",
          "lua_ls",
          "sqls",
          "terraformls",
          "ts_ls",
          "yamlls",
          "ruby_lsp",
          "rust_analyzer",
          "harper_ls",
          "svelte",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global defaults merged into every server config (Nvim 0.11+ API).
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Buffer-local mappings, set when a server attaches.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts)
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts)
          vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

          -- copied from LazyVim
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "gopls",
        "terraformls",
        "bashls",
        "yamlls",
        "sqls",
        "dockerls",
        "ruby_lsp",
        "rust_analyzer",
        "harper_ls",
        "svelte",
      })
    end,
  },
}
