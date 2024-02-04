return {
	-- Colorscheme
	{
		"olimorris/onedarkpro.nvim",
		priority = 100,
		init = function()
			vim.cmd("colorscheme onedark")
		end,
	},
}
