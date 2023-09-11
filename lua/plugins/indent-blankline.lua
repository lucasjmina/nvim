return {
    {"lukas-reineke/indent-blankline.nvim",
        config = function ()
            --vim.opt.list = true
            --vim.opt.listchars:append "space:⋅"
            --vim.opt.listchars:append "eol:↴"
            require("indent_blankline").setup {
                filetype_exclude = {
                    "lspinfo",
                    "packer",
                    "checkhealth",
                    "help",
                    "man",
                    "rdoc",
                    "",
                },
            }
        end
    },
}
