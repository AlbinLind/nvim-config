return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Add custom keymap
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format current buffer",
		},
	},
	opts = {

		format_on_save = { timeout_ms = 500, lsp_fallback = true },

		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
