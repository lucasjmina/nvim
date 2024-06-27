vim.o.backup      = false                         -- Don't store backup
vim.o.writebackup = false                         -- Don't store backup

vim.cmd("filetype plugin indent on")              -- Enble filetype plugins

vim.o.breakindent   = true                        -- Indent wrapped lines to match line start
vim.o.colorcolumn   = '+1'                        -- Draw colored column one step to the right of desired maximum width (+1 of textwidth)
vim.o.laststatus    = 2                           -- Always show statusline
vim.o.linebreak     = true                        -- Wrap long lines at 'breakat' (if 'wrap' is vim.o)
vim.o.list          = true                        -- Show helpful character indicators
vim.o.ruler         = false                       -- Don't show cursor position
vim.o.number        = true                        -- Show line numbers
vim.o.shortmess     = 'aoOWFcS'                   -- Disable certain messages from |ins-completion-menu|
vim.o.showmode      = false                       -- Don't show mode in command line
vim.o.showtabline   = 2                           -- Always show tabline
vim.o.signcolumn    = 'number'                    -- Always show signcolumn or it would frequently shift
vim.o.splitbelow    = true                        -- Horizontal splits will be below
vim.o.splitright    = true                        -- Vertical splits will be to the right
vim.o.termguicolors = true                        -- Enable gui colors
vim.o.winblend      = 10                          -- Make floating windows slightly transparent
vim.o.wrap          = false                       -- Display long lines as just one line
vim.o.title         = true                        -- vim.o window title
vim.o.completeopt   = 'menuone,noinsert,noselect' -- Customize completions
vim.cmd("colorscheme nvim_colors")                -- vim.o colorscheme

vim.o.fillchars     = table.concat(
  { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
  ','
)
vim.o.listchars     = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')
vim.o.cursorlineopt = 'screenline,number' -- Show cursor line only screen line when wrapped

if vim.fn.has('nvim-0.9') == 1 then
  vim.opt.shortmess:append('C') -- Don't show "Scanning..." messages
  vim.o.splitkeep = 'screen'    -- Reduce scroll during window split
end

-- Enable syntax highlighing if it wasn't already (as it is time consuming)
-- Don't use defer it because it affects start screen appearance
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end


vim.o.autoindent    = true          -- Use auto indent
vim.o.expandtab     = true          -- Convert tabs to spaces
vim.o.formatoptions = 'rqnl1j'      -- Improve comment editing
vim.o.ignorecase    = true          -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     = true          -- Show search results while typing
vim.o.infercase     = true          -- Infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    = 2             -- Use this number of spaces for indentation
vim.o.smartcase     = true          -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent   = true          -- Make indenting smart
vim.o.tabstop       = 2             -- Insert 2 spaces for a tab
vim.o.virtualedit   = 'block'       -- Allow going past the end of line in visual block mode
vim.o.clipboard     = 'unnamedplus' -- Use system clipboard
vim.o.undofile      = true          -- Save undo history
vim.o.backup        = false         -- Don't store backup
vim.o.switchbuf     = 'usetab'      -- Use already opened buffers when switching
vim.o.writebackup   = false         -- Don't store backup

vim.opt.iskeyword:append('-')       -- Treat dash separated words as a word text object

-- Define pattern for a start of 'numbered' list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Folds settings for treesitter
vim.o.foldmethod    = "expr"
vim.o.foldexpr      = "nvim_treesitter#foldexpr()"
vim.o.foldenable    = false
vim.o.foldlevel     = 9999

vim.o.spelllang     = 'en,es,uk'    -- Define spelling dictionaries
vim.o.spelloptions  = 'camel'       -- Treat parts of camelCase words as seprate words
