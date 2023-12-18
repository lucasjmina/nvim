vim.keymap.set('n', '<Leader>s',":exec 'norm '.(90 - strlen(getline('.'))).'A-'<CR>")
vim.keymap.set("n", "<Leader>e", "<cmd>Explore<CR>")
vim.keymap.set('t', '<C-space>', [[<C-\><C-n>]])
