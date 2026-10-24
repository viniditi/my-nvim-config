return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        -- Mapeamento para abrir/fechar o terminal
        open_mapping = [[<C-\>]],
        -- Define que o terminal abrirá centralizado e flutuante
        direction = "float",

        -- Customizações visuais da janela flutuante
        float_opts = {
          border = "curved", -- Tipos: 'single', 'double', 'shadow', 'curved'
          winblend = 3, -- Transparência da janela (0 a 100)
        },
      })
    end,
  },
}
