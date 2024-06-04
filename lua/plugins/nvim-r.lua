return {
    {"jalvesaq/Nvim-R",
        config = function()
            vim.g.R_assign_map = '<M-->'
            vim.g.R_df_viewer = "View(%s)"
            vim.g.r_indent_align_args = 0
            vim.g.r_indent_ess_comments = 0
            vim.g.r_indent_ess_compatible = 0
            vim.g.R_objbr_auto_start = 1
            vim.g.R_rconsole_width = 0
            vim.g.R_rconsole_height = 10
            vim.g.R_objbr_opendf = 0
            vim.g.R_objbr_openlist = 0
            vim.g.R_min_editor_width = 100
            vim.g.rout_follow_colorscheme = 1
            vim.g.R_hl_term = 0
            vim.g.R_hi_fun = 0
            vim.g.R_nvim_wd = 1
            vim.g.R_pdfviewer = "evince"
        end,
    }
}
