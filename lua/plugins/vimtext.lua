return {
    "lervag/vimtex",
    enabled = false,
    init = function()
        -- Use init for configuration, don't use the more common "config".
        vim.g.vimtex_compiler_latexmk = {
            continuous = 0
        }
    end
}
