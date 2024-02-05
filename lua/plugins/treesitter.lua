return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "python", "rust", "javascript", "vue", "vimdoc", "yaml", "vim", "luadoc", "diff", "markdown", "toml"},
			highlight = { enable = true },
      sync_install = false,
      auto_install = true,
      ignore_install = {}
		})
	end,
}
