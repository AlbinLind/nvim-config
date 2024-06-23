-- bootstrap lazy.nvim, LazyVim and your plugins
local f = io.open("/home/albin/.config/tree_config.lua", "r")
if f ~= nil then
  package.path = package.path .. ";/home/albin/.config/tree_config.lua"
  require("tree_config")
end
require("config.set")
require("config.keymaps")
require("config.lazy")
