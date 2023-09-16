return {
    -- Nvim-tree file explorer https://github.com/nvim-tree/nvim-tree.lua
    {'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        enabled = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {"<leader>e", "<cmd>NvimTreeToggle<cr>"},
        },
        config = function()
            require('nvim-tree').setup {
                disable_netrw = false,
                hijack_netrw = true,
                git = {
                    enable = false
                },
                renderer = {
                    indent_markers = {
                        enable = true
                    },
                    icons = {
                        show = {
                            folder = false,
                            file = false,
                            git = false,
                            folder_arrow = false,
                            diagnostics = false,
                            modified = false
                        },
                    },
                },
            }
        end,
    },
}
