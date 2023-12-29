return {
    {"RRethy/nvim-base16",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme base16-one-light")
            vim.cmd("autocmd ColorScheme * highlight MatchParen gui=underline ctermbg=0 guibg=NULL")
        end
    }
}
