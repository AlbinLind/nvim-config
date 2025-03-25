return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = true,
    opts = {
      overrides = function(colors)
        return {
          ["@lsp.type.import"] = { fg = "#00FF00" },
        }
      end,
      colors = {
        palette = {
          fujiGray = "#DCA561",
          carpYellow = "#7AA89F",
          waveAqua2 = "#E6C384",
          crystalBlue = "#83a598",
          oniViolet = "#d3869b",
        }
      }
    },
    init = function()
      -- vim.cmd("colorscheme kanagawa-wave")
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      italic = {
        strings = false,
        emphasis = true,
        comments = false,
        operators = false,
        folds = false
      },
      overrides = {
        ["@lsp.type.namespace"] = { fg = "#d79921" },
        Comment = { fg = "#fe8019", italic = true },
      },
      palette_overrides = {
      }
    },
    init = function()
      vim.cmd("colorscheme gruvbox")
    end
  }
}
