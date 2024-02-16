return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<M-l>",
						next = "<M-[>",
						prev = "<M-]>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
				filetypes = {
					markdown = true,
					help = true,
				},
			})
		end,
	},
}
