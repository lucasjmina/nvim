return {
    -- Configs for Nvim LSP client
    {"neovim/nvim-lspconfig",
        config = function()

            -- Use LSP root_dir to se working directory
            -- add  on_attach = custom_lsp_attach to server config
            local custom_lsp_attach = function(client)
                vim.api.nvim_set_current_dir(client.config.root_dir)
            end

            -- See :help lspconfig-global-defaults
            local lsp_defaults = {
                capabilities = require("cmp_nvim_lsp").default_capabilities()
            }

            local lspconfig = require('lspconfig')
            lspconfig.util.default_config = vim.tbl_deep_extend(
                'force',
                lspconfig.util.default_config,
                lsp_defaults
            )
            -- Setup language servers.
            lspconfig.lua_ls.setup {}
            lspconfig.clangd.setup {
                on_attach = custom_lsp_attach,
            }
            lspconfig.bashls.setup {}
            lspconfig.r_language_server.setup {
                root_dir = lspconfig.util.root_pattern("*.Rproj", ".git"),
                on_attach = custom_lsp_attach
            }
            -- lspconfig.rust_analyzer.setup {
            --     -- Server-specific settings. See `:help lspconfig-setup`
            --     settings = {
            --         ['rust-analyzer'] = {},
            --     },
            -- }

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                    vim.diagnostic.config({virtual_text = false})

                    -- Dialog borders
                    local _border = "rounded"
                    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                        vim.lsp.handlers.hover, {
                            border = _border
                        }
                    )
                    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                        vim.lsp.handlers.signature_help, {
                            border = _border
                        }
                    )
                    vim.diagnostic.config{
                        float={border=_border}
                    }
                    require('lspconfig.ui.windows').default_options = {
                        border = _border
                    }
                end,
            })
        end
    }
}
