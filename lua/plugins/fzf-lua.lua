return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
        -- TODO: There has to be a better way to do this instead of repeating it likes this.
        grep = {
            actions = {
                ["ctrl-y"]      = function(selected)
                    for _, e in ipairs(selected) do
                        local file = require'fzf-lua'.path.entry_to_file(e)
                        vim.cmd("badd " .. file.path)
                    end
                end,
            },
        },
        files = {
            actions = {
                ["ctrl-y"]      = function(selected)
                    for _, e in ipairs(selected) do
                        local file = require'fzf-lua'.path.entry_to_file(e)
                        vim.cmd("badd " .. file.path)
                    end
                end,
            },
        },
        vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", {}),
        vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", {}),
        vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", {}),
        vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua lines<CR>", {}),
        vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<CR>", {}),
        vim.keymap.set("n", "<leader>fa", "<cmd>FzfLua lsp_code_actions<CR>", {}),
        vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", {}),
        vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", {}),
        vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua<CR>", {})
    })
  end
}
