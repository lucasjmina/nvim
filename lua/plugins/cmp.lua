return {
    {"hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "jalvesaq/cmp-nvim-r",
            "hrsh7th/cmp-cmdline"
        },
        config = function()

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local luasnip = require("luasnip")
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    --completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    -- Mapping to use TAB for cmp and lusnip
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                            -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp', priority = 10},
                    { name = 'luasnip', priority = 9},
                    { name = 'path', priority = 8},
                    { name = 'buffer', priority = 0, keyword_length = 3},
                    }),

                formatting = {
                    format = function(entry, vim_item)
                        --vim_item.kind = "kind"
                        vim_item.menu = "menu"
                        vim_item.menu = ({
                            path = "[PATH]",
                            cmp_nvim_r = "[R]",
                            r_constants = "[R]",
                            nvim_lsp = "[LSP]",
                            buffer = "[BUFFER]",
                            luasnip = "[LSNIP]"
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('r', {
                sources = cmp.config.sources({
                    { name = 'r_constants', priority = 11},
                    { name = 'cmp_nvim_r', priority = 10},
                    { name = 'nvim_lsp', priority = 9},
                    { name = 'luasnip', priority = 8},
                    { name = 'path', priority = 7},
                    { name = 'buffer', priority = 0, keyword_length = 3},
                    })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer', keyword_length = 3}
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                        { name = 'cmdline' }
                    })
            })
        end
    }
}

