return {
    'echasnovski/mini.pick',
    version = false,
    config = function ()
        require('mini.pick').setup({
        vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>", {}),
        vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<CR>", {}),
        vim.keymap.set("n", "<leader>pg", "<cmd>Pick grep_live<CR>", {}),
        vim.keymap.set("n", "<leader>pl", "<cmd>Pick buf_lines<CR>", {}),
        vim.keymap.set("n", "<leader>pd", "<cmd>Pick diagnostic scope='current'<CR>", {}),
        vim.keymap.set("n", "<leader>ps", "<cmd>Pick lsp scope='document_symbol'<CR>", {}),
        vim.keymap.set("n", "<leader>pr", "<cmd>Pick lsp scope='references'<CR>", {}),
    })

    end
}
