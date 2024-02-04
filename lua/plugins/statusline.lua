return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = function()
			vim.o.laststatus = vim.g.lualine_laststatus
			return {
				tabline = {},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location", "os.date('%H:%M')" },
				},
			}
		end,
	},
}
