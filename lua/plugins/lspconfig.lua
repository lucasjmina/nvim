return {
    -- Configs for Nvim LSP client
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
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
        vim.lsp.enable('lua_ls')
        vim.lsp.config('lua_ls', {
          capabilities = { capabilities },
        })

        vim.lsp.enable('clangd')
        vim.lsp.config('clangd', {
          capabilities = { capabilities }
        })

        vim.lsp.enable('bashls')
        vim.lsp.config('bashls', {
          capabilities = { capabilities }
        })

        vim.lsp.enable('r_language_server')
        vim.lsp.config('r_language_server', {
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, function(name) return name:match('%.Rproj$') ~= nil end) or vim.fs.root(bufnr, '.git') or vim.uv.os_homedir())
          end,
          capabilities = { capabilities }
        })

        vim.lsp.enable('marksman')
        vim.lsp.config('marksman', {
          capabilities = { capabilities }
        })

        vim.lsp.enable('texlab')
        vim.lsp.config('texlab', {
          capabilities = { capabilities }
        })

        vim.lsp.enable('sqls')
        vim.lsp.config('sqls', {
          capabilities = { capabilities }
        })
    end
}
