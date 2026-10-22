return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.prettier,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.ruff,
      },
    })
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.format, {})
    vim.keymap.set("n", "<C-s>", vim.lsp.buf.format, {})
  end,
}
