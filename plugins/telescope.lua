return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },

        opts = {},

        config = function() 
            vim.keymap.set("n", "<C-p>", function()
                require("telescope.builtin").find_files()
            end)

            vim.keymap.set("n", "<leader>fg", function()
                require("telescope.builtin").live_grep()
            end)
        end
    }, 
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {

                        }

                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
