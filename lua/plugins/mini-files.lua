return {
    'echasnovski/mini.files',
    version = false,
    config = function ()
        require('mini.files').setup({
            content = {prefix = function() end}
        })
        vim.api.nvim_set_keymap("n", "<leader>fe", "", {
            noremap = true,
            callback = function()
                MiniFiles.open(vim.api.nvim_buf_get_name(0))
            end,
        })
    end
}
