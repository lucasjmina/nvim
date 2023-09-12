return {
    {"jalvesaq/Nvim-R",
        config = function()
            vim.g.R_assign_map = '<M-->'
            vim.g.R_csv_app = "terminal:vd"
            vim.g.r_indent_align_args = 0
            vim.g.r_indent_ess_comments = 0
            vim.g.r_indent_ess_compatible = 0
            vim.g.R_hi_fun_paren = 1
            vim.g.R_objbr_auto_start = 1
            vim.g.R_rconsole_width = 0
            --vim.g.R_fun_data_1 = {'select', 'rename', 'mutate', 'filter'}
            --vim.g.R_fun_data_2 = "{'ggplot': ['aes'], 'with': ['lm', 'glm', 'lmer']}"
            vim.g.R_rconsole_height = 10
            vim.g.R_objbr_opendf = 0
            vim.g.R_objbr_openlist = 0
            vim.g.R_min_editor_width = 100
            vim.g.rout_follow_colorscheme = 1
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {"r", "rmd", "rnoweb"},
                callback = function(args)
                    vim.keymap.set("i", ">>", "<Esc>:normal! a %>%<CR>a", {buffer = args.buf})
                end
            })
        end,
    }
}
