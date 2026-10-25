return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local bufferline = require("bufferline")

      bufferline.setup({
        options = {
          mode = "buffers",
          separator_style = "thin",
          always_show_bufferline = true,

          show_buffer_close_icons = true,
          show_close_icon = true,

          color_icons = true,
          show_buffer_icons = true,

          -- Aparência minimalista
          indicator = {
            style = "underline",
          },

          diagnostics = false,
          offsets = {},
          hover = {
            enabled = false,
          },
        },

        highlights = {
          fill = {
            bg = "#1e1e2e",
          },

          background = {
            fg = "#9399b2",
            bg = "#1e1e2e",
          },

          buffer_visible = {
            fg = "#bac2de",
            bg = "#1e1e2e",
          },

          buffer_selected = {
            fg = "#cdd6f4",
            bg = "#1e1e2e",
            bold = false,
            italic = false,
            underline = true,
          },

          indicator_visible = {
            fg = "#89b4fa",
            bg = "#1e1e2e",
          },

          indicator_selected = {
            fg = "#89b4fa",
            bg = "#1e1e2e",
          },

          separator = {
            fg = "#313244",
            bg = "#1e1e2e",
          },

          separator_visible = {
            fg = "#313244",
            bg = "#1e1e2e",
          },

          separator_selected = {
            fg = "#313244",
            bg = "#1e1e2e",
          },
        },
      })
      -- Arquivo anterior
      vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {
        silent = true,
        desc = "Arquivo anterior",
      })

      -- Próximo arquivo
      vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {
        silent = true,
        desc = "Próximo arquivo",
      })
    end,
  },
}
