return {
	-- blink.cmp
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "default",
				["<C-j>"] = { "select_and_accept", "accept" },
				["<C-space>"] = { "show" },
			},
			cmdline = {
				enabled = true,
				keymap = {
					preset = "default",
					["<C-j>"] = { "select_and_accept", "accept" },
					["<C-space>"] = { "show" },
				},
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"saghen/blink.cmp",
			{ "mason-org/mason.nvim", build = ":MasonUpdate" },
			{ "mason-org/mason-lspconfig.nvim", config = function() end },
			"stevearc/conform.nvim",
		},
		opts = function()
			local ret = {
				-- diagnostics = {
				-- 	underline = true,
				-- 	update_in_insert = false,
				-- 	virtual_text = {
				-- 		prefix = "",
				-- 		source = "if_many",
				-- 		spacing = 4,
				-- 	},
				-- 	signs = {
				-- 		text = {
				-- 			[vim.diagnostic.severity.ERROR] = " ",
				-- 			[vim.diagnostic.severity.WARN] = " ",
				-- 			[vim.diagnostic.severity.HINT] = " ",
				-- 			[vim.diagnostic.severity.INFO] = " ",
				-- 		},
				-- 	},
				-- },
				-- inlay_hints = { enabled = false },
				-- codelens = { enabled = false },
				-- folds = { enabled = false },
				capabilities = require("blink.cmp").get_lsp_capabilities({
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				}),
				servers = {
					lua_ls = {},
					basedpyright = {
						filetypes = { "python" },
						settings = {
							basedpyright = {
								analysis = { typeCheckingMode = "standard" },
							},
						},
					},
					rust_analyzer = {},
					marksman = {},
					taplo = {},
					ruff = {
						on_attach = function(client, bufnr)
							vim.keymap.set("n", "<leader>co", function()
								vim.lsp.buf.code_action({
									apply = true,
									context = { only = { "source.organizeImports" }, diagnostics = {} },
								})
							end, { buffer = bufnr, desc = "Organize Imports" })
							client.server_capabilities.hoverProvider = false
						end,
					},
					ts_ls = {},
					jsonls = {},
					texlab = {
						keys = {
							{ "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
						},
					},
				},
				setup = {},
			}
			return ret
		end,
		config = function(_, opts)
			vim.diagnostic.config(opts.diagnostics)

			if opts.capabilities then
				vim.lsp.config("*", { capabilities = opts.capabilities })
			end

			local servers = vim.tbl_keys(opts.servers)
			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local mason_all = have_mason
					and vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
				or {}

			local function configure(server)
				local sopts = opts.servers[server]
				sopts = sopts == true and {} or (not sopts) and { enabled = false } or sopts
				if sopts.enabled == false then
					return true
				end

				local setup = opts.setup[server] or opts.setup["*"]
				if setup and setup(server, sopts) then
					return true
				end

				vim.lsp.config(server, sopts)
				if sopts.mason == false or not vim.tbl_contains(mason_all, server) then
					vim.lsp.enable(server)
					return true
				end
			end

			local exclude = vim.tbl_filter(configure, servers)
			if have_mason then
				mlsp.setup({
					ensure_installed = vim.tbl_filter(function(server)
						return not vim.tbl_contains(exclude, server)
					end, servers),
					automatic_enable = { exclude = exclude },
				})
			end
		end,
	},

	-- mason
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"lua-language-server",
				"basedpyright",
				"ruff",
				"rust-analyzer",
				"marksman",
				"taplo",
				"stylua",
				"typescript-language-server",
				"json-lsp",
				"texlab",
				"tex-fmt",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					vim.api.nvim_exec_autocmds("FileType", {})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},

	-- conform
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				python = { "ruff" },
				lua = { "stylua" },
				latex = { "tex-fmt" },
				tex = { "tex-fmt" },
			},
		},
	},
}
