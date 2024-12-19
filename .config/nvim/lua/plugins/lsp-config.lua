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
          "powershell_es",
          "sqls",
          "terraformls",
          "ts_ls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up lspconfig.
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local opts = {
        on_attach = function(_, bufnr)
          -- Mappings.
          local opts = { buffer = bufnr, noremap = true, silent = true }
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
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

          -- copied from LazyVim
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
        capabilities = capabilities,
      }

      lspconfig.lua_ls.setup(opts)
      lspconfig.ts_ls.setup(opts)
      lspconfig.gopls.setup(opts)
      lspconfig.golangci_lint_ls.setup(opts)
      lspconfig.terraformls.setup(opts)
      lspconfig.bashls.setup(opts)
      lspconfig.yamlls.setup(opts)
      lspconfig.powershell_es.setup({
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      })
      lspconfig.sqls.setup(opts)
      lspconfig.dockerls.setup(opts)
    end,
  },
}
