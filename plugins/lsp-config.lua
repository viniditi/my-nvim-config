return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          prefix = "●",
        },

        signs = true,
        underline = true,

        severity_sort = true,

        update_in_insert = true,

        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Atalhos do LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      -- Configuração do TypeScript / JavaScript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,

        settings = {
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
            },
          },

          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
            },
          },
        },
      })

      -- Configuração do Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      -- Configuração do Python
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })
    end,
  },
}
