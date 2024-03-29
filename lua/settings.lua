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
set.autochdir = false
set.smartindent = true
set.expandtab = true
set.statusline='[%n] %y %F%m%=%=line:%l/%L col:%v'
set.number = true
set.relativenumber = true
set.signcolumn = 'number'
set.title = true
set.termguicolors = true
-- Folds settings for treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.foldlevel = 9999

-- Settings for netwr
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 20
vim.g.netrw_localcopydircmd = "cp -r"

