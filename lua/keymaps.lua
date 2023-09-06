vim.keymap.set('n', '<Leader>s',":exec 'norm '.(90 - strlen(getline('.'))).'A-'<CR>")
