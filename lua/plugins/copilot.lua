return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      keymap = {
        accept = "<M-i>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<M-u>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = false,
      help = false,
      latex = false,
      gitcommit = false,
      gitrebase = false,
    },
  },
}
