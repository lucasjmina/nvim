local skeletons = "0read ~/.config/nvim/skeletons/"

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.R"},
    command = (skeletons .. "skel.R | goto 99")
})

-- Disable linenumbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = ("setlocal nonumber norelativenumber")
})

vim.api.nvim_create_autocmd("BufNewFile",{
    pattern = "*",
    command = ("%s#<eval>\\(.\\{-\\}\\)</eval>#\\=eval(submatch(1))#ge | goto 99")
})
