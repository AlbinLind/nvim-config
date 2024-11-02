-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
    -- vscode init
  require("vscode_config.set")
  require("vscode_config.keymaps")
  require("vscode_config.lazy")
else
  require("config.set")
  require("config.keymaps")
  require("config.lazy")
end
