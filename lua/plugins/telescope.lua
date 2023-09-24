return {
    {"nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", {})
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
                    buffers = {
                        disable_devicons = true,
                        sort_lastused = true,
                        sort_mru = true
                    },
                    help_tags = {disable_devicons = true},
                },
                extensions = {
                    file_browser = {
                        dir_icon = "🗀",
                        git_status = false,
                        select_buffer = true,
                        display_stat = false,
                        grouped = false,
                        respect_gitignore = false
                    }
                }
            }
            require("telescope").load_extension "file_browser"
        end
    }
}
