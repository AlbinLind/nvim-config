-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Run :VenvSelectCached when entering a python file
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		require("venv-selector").retrieve_from_cache()
		-- Reload the current buffer to activate the new venv
	end,
	once = true,
})
