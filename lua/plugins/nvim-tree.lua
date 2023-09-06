return {
    -- Nvim-tree file explorer https://github.com/nvim-tree/nvim-tree.lua
    {'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
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
                renderer = {        
                    icons = {
                        web_devicons = {
                            file = {
                                enable = false,
                                color = false,
                            },
                            folder = {
                                enable = false,
                                color = false,
                            },
                        },
                        glyphs = {
                            default = "🗎",
                            symlink = "🖇",
                            bookmark = "٭",
                            modified = "●",
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                default = "🗀",
                                open = "🗁",
                                empty = "🗀",
                                empty_open = "🗁",
                                symlink = "🖇",
                                symlink_open = "🖇",
                            },
                            git = {
                                unstaged = "☒",
                                staged = "☑",
                                unmerged = "⛕",
                                renamed = "✏",
                                untracked = "⚠",
                                deleted = "🗑",
                                ignored = "◌",
                            },
                        },
                    },
                },
            }    
        end,
    },
}
