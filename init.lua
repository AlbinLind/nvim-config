-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
    -- VSCode nvim config
    require("vscode.config.keymaps")
else
    require("config.set")
    require("config.keymaps")
    require("config.lazy")
end
