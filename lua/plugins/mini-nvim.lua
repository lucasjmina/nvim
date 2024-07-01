return {
    'echasnovski/mini.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = false,
    config = function()
        require('mini.extra').setup()

        require('mini.surround').setup()

        require('mini.pairs').setup({
            mappings = {
                ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
            }
        })

        require('mini.pick').setup()

        require('mini.bufremove').setup()

        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                B = MiniExtra.gen_ai_spec.buffer(),
                F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
            },
        })

        require('mini.files').setup()

        require('mini.indentscope').setup({ symbol = "│" })

        require('mini.statusline').setup()

        require('mini.tabline').setup()

        require('mini.trailspace').setup({})

        require('mini.splitjoin').setup()

        require('mini.move').setup()

        require('mini.cursorword').setup()

        require('mini.git').setup()

        require('mini.diff').setup()

        require('mini.bracketed').setup()
    end
}
