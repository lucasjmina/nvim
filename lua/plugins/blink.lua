return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',
  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  opts = {
    completion = {
      accept = { auto_brackets = { enabled = false }, }
    },
    signature = { enabled = true },
    sources = {
      providers = {
        path = {
          opts = {
            get_cwd = function() return vim.fn.getcwd() end
          }
        }
      }
    }
  },
}

