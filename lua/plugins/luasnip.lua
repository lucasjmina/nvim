return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "saadparwaiz1/cmp_luasnip"
    },
    config = function()
        vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
        
        require('luasnip.loaders.from_vscode').lazy_load()
        
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end
          },
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp', keyword_length = 3},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 3},
          },
          window = {
            documentation = cmp.config.window.bordered()
          },
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
          mapping = {
            ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
            ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        
            ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
            ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
        
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Insert}),
        
            ['<C-d>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, {'i', 's'}),
        
            ['<C-b>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, {'i', 's'}),
        
            ['<Tab>'] = cmp.mapping(function(fallback)
              local col = vim.fn.col('.') - 1
        
              if cmp.visible() then
                cmp.select_next_item(select_opts)
              elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
              else
                cmp.complete()
              end
            end, {'i', 's'}),
        
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item(select_opts)
              else
                fallback()
              end
            end, {'i', 's'}),
          },
        })
        
        cmp.setup.filetype({'r'}, {
            sources = {
            {name = 'cmp_nvim_r', keyword_length = 3},
            {name = 'r_constants'},
            {name = 'path'},
            {name = 'nvim_lsp', keyword_length = 3},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 3},
        
            }
        })
    end
}

