-- Leader mappings

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('n', '<Leader>' .. suffix, rhs, opts)
end
local xmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('x', '<Leader>' .. suffix, rhs, opts)
end

-- l is for 'LSP' (Language Server Protocol)
local formatting_cmd = '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>'
nmap_leader('la', '<Cmd>lua vim.lsp.buf.signature_help()<CR>',  'Arguments popup')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>',   'Diagnostics popup')
nmap_leader('lf', formatting_cmd,                               'Format')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.hover()<CR>',           'Information')
nmap_leader('lj', '<Cmd>lua vim.diagnostic.goto_next()<CR>',    'Next diagnostic')
nmap_leader('lk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>',    'Prev diagnostic')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>',      'References')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>',          'Rename')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>',      'Source definition')

xmap_leader('lf', formatting_cmd,                               'Format selection')

-- b is for 'buffer'
nmap_leader('ba', '<Cmd>b#<CR>',                                 'Alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>',         'Delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  'Delete!')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        'Wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'Wipeout!')

-- e is for 'explore' and 'edit'
nmap_leader('ec', '<Cmd>lua MiniFiles.open(vim.fn.stdpath("config"))<CR>',                                  'Config')
nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>',                                                          'Directory')
nmap_leader('ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>',                              'File directory')

-- f is for 'fuzzy find'
nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>',                 '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>',                 '":" history')
nmap_leader('fp', '<Cmd>Pick registers<CR>',                         'Registers')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>',          'Added hunks (all)')
nmap_leader('fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', 'Added hunks (current)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>',                           'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>',                       'Commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>',              'Commits (current)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>',            'Diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>',        'Diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>',                             'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>',                         'Grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>',            'Grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>',                              'Help tags')
nmap_leader('fH', '<Cmd>Pick hl_groups<CR>',                         'Highlight groups')
nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>',             'Lines (all)')
nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>',         'Lines (current)')
nmap_leader('fm', '<Cmd>Pick git_hunks<CR>',                         'Modified hunks (all)')
nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>',                'Modified hunks (current)')
nmap_leader('fr', '<Cmd>Pick resume<CR>',                            'Resume')
nmap_leader('fR', '<Cmd>Pick lsp scope="references"<CR>',            'References (LSP)')
nmap_leader('fs', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',      'Symbols workspace (LSP)')
nmap_leader('fS', '<Cmd>Pick lsp scope="document_symbol"<CR>',       'Symbols buffer (LSP)')
nmap_leader('fv', '<Cmd>Pick visit_paths cwd=""<CR>',                'Visit paths (all)')
nmap_leader('fV', '<Cmd>Pick visit_paths<CR>',                       'Visit paths (cwd)')


-- g is for git
nmap_leader('gc', '<Cmd>Git commit<CR>',                      'Commit')
nmap_leader('gC', '<Cmd>Git commit --amend<CR>',              'Commit amend')
nmap_leader('gl', '<Cmd>Git log --oneline<CR>',               'Log')
nmap_leader('gL', '<Cmd>Git log --oneline --follow -- %<CR>', 'Log buffer')
nmap_leader('go', '<Cmd>lua MiniDiff.toggle_overlay()<CR>',   'Toggle overlay')
nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',    'Show at cursor')

xmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',  'Show at selection')

-- o is for 'other'
local trailspace_toggle_command = '<Cmd>lua vim.b.minitrailspace_disable = not vim.b.minitrailspace_disable<CR>'
nmap_leader('ot', '<Cmd>lua MiniTrailspace.trim()<CR>',    'Trim trailspace')
nmap_leader('oT', trailspace_toggle_command,                 'Trailspace hl toggle')
