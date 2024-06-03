local ensure_installed = {
    "bash",           "json",  "lua",      "luadoc",   "markdown",    "markdown_inline",  "regex",
    "c",              "cpp",   "arduino",  "comment",  "git_config",  "git_rebase",       "vim",
    "gitattributes",  "ini",   "make",     "python",   "gitignore",   "gitcommit",        "vimdoc",
    "r",              "yaml"
}

return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        cmd = "TSUpdateSync"
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = ensure_installed,
            highlight = { enable = true },
            incremental_selection = { enable = false },
            textobjects = { enable = false },
            indent = { enable = false }
        })
        -- Disable injections in 'lua' language. In Neovim<0.9 it is
        -- `vim.treesitter.query.set_query()`; in Neovim>=0.9 it is
        -- `vim.treesitter.query.set()`.
        local ts_query = require('vim.treesitter.query')
        local ts_query_set = ts_query.set or ts_query.set_query
        ts_query_set('lua', 'injections', '')
    end
}
