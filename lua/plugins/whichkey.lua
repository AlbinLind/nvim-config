return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>g",  group = "comment+git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>s",  group = "search" },
        { "<leader>c",  group = "code" },
        { "<leader>f",  group = "find" },
        { "<leader>b",  group = "buffer" },
      }
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
