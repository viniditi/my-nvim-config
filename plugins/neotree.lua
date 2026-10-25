return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", {
      desc = "Toggle Neo-tree",
      silent = true,
    })
    vim.keymap.set("n", "<C-Tab>", function()
      local neo_tree = vim.fn.bufname():match("neo%-tree")

      if neo_tree then
        vim.cmd("wincmd l")
      else
        vim.cmd("wincmd h")
      end
    end, {
      desc = "Alternar foco Neo-tree/arquivo",
      silent = true,
    })
  end,
}
