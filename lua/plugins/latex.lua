return {
  {
    "lervag/vimtex",
    lazy = false,                                         -- lazy-loading will disable inverse search
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_compiler_method = "tectonic"
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_quickfix_mode = 1
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
  }
}
