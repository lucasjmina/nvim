-- Disable linenumbers in terminal
local terminal = vim.api.nvim_create_augroup('noNumbers', {})
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    group = terminal,
    command = ("setlocal nonumber norelativenumber")
})
