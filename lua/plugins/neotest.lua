return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mrcjkb/rustaceanvim",
		},
		init = function()
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
					["neotest-python"] = {},
				},
			})
		end,
	},
}
