return {
    'echasnovski/mini.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = false,
    config = function()
        require('mini.surround').setup()

        require('mini.pairs').setup()

        require('mini.pick').setup({
            vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>", {}),
            vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<CR>", {}),
            vim.keymap.set("n", "<leader>pg", "<cmd>Pick grep_live<CR>", {}),
            vim.keymap.set("n", "<leader>pl", "<cmd>Pick buf_lines<CR>", {}),
            vim.keymap.set("n", "<leader>pd", "<cmd>Pick diagnostic scope='current'<CR>", {}),
            vim.keymap.set("n", "<leader>ps", "<cmd>Pick lsp scope='document_symbol'<CR>", {}),
            vim.keymap.set("n", "<leader>pr", "<cmd>Pick lsp scope='references'<CR>", {}),
        })

        require('mini.extra').setup()

        require('mini.bufremove').setup({
            vim.api.nvim_set_keymap("n", "<leader>bd", "", {
                noremap = true,
                callback = function()
                    MiniBufremove.delete()
                end
            })
        })

        require('mini.files').setup({
            -- Do not show icons
            -- content = { prefix = function() end },
            vim.api.nvim_set_keymap("n", "<leader>fe", "", {
                noremap = true,
                callback = function()
                    MiniFiles.open(vim.api.nvim_buf_get_name(0))
                end,
            })
        })

        require('mini.indentscope').setup({ symbol = "│" })

        require('mini.statusline').setup()

        require("mini.base16").setup({
            palette = {
                base00 = "#fafafa",
                base01 = "#f0f0f1",
                base02 = "#e5e5e6",
                base03 = "#a0a1a7",
                base04 = "#696c77",
                base05 = "#383a42",
                base06 = "#202227",
                base07 = "#090a0b",
                base08 = "#ca1243",
                base09 = "#d75f00",
                base0A = "#c18401",
                base0B = "#50a14f",
                base0C = "#0184bc",
                base0D = "#4078f2",
                base0E = "#a626a4",
                base0F = "#986801"
            }
        })
    end
}
