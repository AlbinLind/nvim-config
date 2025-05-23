return { {
  'saghen/blink.cmp',
  -- use a release tag to download pre-built binaries
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
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
        }
      }
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
},
  -- LSP servers and clients communicate which features they support through "capabilities".
  --  By default, Neovim supports a subset of the LSP specification.
  --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
  --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
  --
  -- This can vary by config, but in general for nvim-lspconfig:

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp',
      { "williamboman/mason.nvim",           version = "1.*" },
      { "williamboman/mason-lspconfig.nvim", version = "1.*" },
      "stevearc/conform.nvim"
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          prefix = "",
          source = "if_many",
          spacing = 4,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        }
      },
      servers = {
        lua_ls = {},
        basedpyright = {
          file_types = { "python" },
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard"
              }
            }
          }
        },
        rust_analyzer = {},
        marksman = {},
        taplo = {},
        ruff = {
          on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>co',
              '<cmd>lua vim.lsp.buf.code_action({apply = true,context = {only = {"source.organizeImports"},diagnostics = {},}})<cr>',
              { desc = "Organize Imports", noremap = true, silent = true })
            client.server_capabilities.hoverProvider = false
          end
        },
        ts_ls = {},
        jsonls = {},
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      }
    },
    config = function(_, opts)
      require('mason').setup({})
      require('mason-lspconfig').setup({})

      local lspconfig = require('lspconfig')

      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  },
  {
    { "mason.nvim", version = "1.*" },
    {
      "williamboman/mason-lspconfig.nvim",
      version = "1.*",
      lazy = false,
      config = function() end,
      opts = {
        ensure_installed = {
          "lua_ls",
          "basedpyright",
          "ruff",
          "rust_analyzer",
          "marksman",
          "taplo",
          "stylua",
          "ts_ls",
          "jsonls",
          "texlab",
          "tex-fmt",
        },
      }
    }
  },
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        lsp_format = "fallback"
      },
      formatters_by_ft = {
        python = {
          "ruff"
        },
        lua = {
          "stylua"
        },
        latex = {
          "tex-fmt"
        },
        tex = {
          "tex-fmt"
        },
      }
    }
  }
}
