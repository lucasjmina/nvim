return {
    'echasnovski/mini.bufremove',
    version = false,
    config = function ()
        require('mini.bufremove').setup()
	vim.api.nvim_set_keymap("n", "<leader>bd", "", {
		noremap = true,
		callback = function()
			MiniBufremove.delete()
		end
	})
    end
}
