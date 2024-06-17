return {
  -- Add ability to comment out code
	{
		"echasnovski/mini.comment",
		version = "*",
		event = "BufEnter",
		keys = {},
		opts = {

			mappings = {
				comment = "gc",
				comment_line = "<leader>gc",
				comment_visual = "gc",
				textobject = "gco",
			},
		},
	},
  -- Add pairing so that brackets close together
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "VeryLazy",
		init = function()
			require("mini.pairs").setup({})
		end,
	},

	-- Visualize the indentation
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "VeryLazy",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
