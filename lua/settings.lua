local set = vim.opt

set.backspace = 'indent,eol,start'
set.scrolloff = 10
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.clipboard = 'unnamedplus'
set.colorcolumn = '100'
set.wrap = true
set.linebreak = true
set.autochdir = true
set.smartindent = true
set.expandtab = true
set.statusline='[%n] %y %F%m%=%=line:%l/%L col:%v'
set.number = true
set.relativenumber = true
set.signcolumn = 'number'

-- Folds settings for treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.foldlevel = 9999
