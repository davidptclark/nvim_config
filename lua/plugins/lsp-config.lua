return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({
        capabilites = capabilities,
        filetypes = {"go"}
      })
      lspconfig.tsserver.setup({
        capabilites = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilites = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilites = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
