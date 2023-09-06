return {
    -- Edge colorscheme https://github.com/sainnhe/edge
    {'sainnhe/edge',
        priority = 1000,
        enabled = false,
        config = function()
            vim.cmd('colorscheme edge')
            vim.opt.termguicolors = true
        end
    },
    {"folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.cmd("colorscheme tokyonight-day")
        end
    },
    {"RRethy/nvim-base16",
        priority = 1000,
        enabled = true,
        config = function()
            vim.cmd("colorscheme base16-one-light")
        end
    }
}
