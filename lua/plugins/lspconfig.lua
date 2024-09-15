return {
    -- Configs for Nvim LSP client
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        local diagnostic_opts = {
            -- Show gutter sings
            signs = {
                -- With highest priority
                priority = 9999,
                -- Only for warnings and errors
                severity = { min = 'WARN', max = 'ERROR' },
            },
            -- Show virtual text only for errors
            virtual_text = { severity = { min = 'ERROR', max = 'ERROR' } },
            -- Don't update diagnostics when typing
            update_in_insert = false,
        }

        vim.diagnostic.config(diagnostic_opts)

        -- Setup language servers.
        lspconfig.lua_ls.setup {}

        lspconfig.clangd.setup {}

        lspconfig.bashls.setup {}

        lspconfig.r_language_server.setup {
            root_dir = function(fname)
                return lspconfig.util.root_pattern("*.Rproj", ".git")(fname) or vim.loop.os_homedir()
            end,
        }

        lspconfig.marksman.setup {}

        lspconfig.texlab.setup {}

        lspconfig.sqls.setup {}
    end
}
