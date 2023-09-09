local skeletons = "0read ~/.config/nvim/skeletons/"

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.R"},
    command = (skeletons .. "skel.R | goto 99")
})
