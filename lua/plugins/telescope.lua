return {
    {"nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {["<esc>"] = require("telescope.actions").close}
                    },
                    -- There has to be a better way to do this
                    -- file_ignore_patterns = {
                    --    "%.png", "%.jpg", "%.jpeg", "%.doc", "%.pdf", "%.xls", "%.rds",
                    --    "%.zip", "%.rar", "%.svg", "%.odf", "%.odt", "%.ods", "%.odp"
                    -- }
                },
                pickers = {
                    find_files = {disable_devicons = true},
                    live_grep = {disable_devicons = true},
                    buffers = {disable_devicons = true},
                    help_tags = {disable_devicons = true},
                }
            }
        end
    }
}
