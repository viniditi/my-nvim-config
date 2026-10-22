return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "lua",
            "python",
            "javascript",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "lua",
                "python",
                "javascript",
            },
            callback = function()
                vim.treesitter.start()

                vim.bo.indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
