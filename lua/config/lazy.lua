local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Import and download plugins folder(s)
  spec = { { import = "plugins" } },

  -- Set up the defaults for plugins that we load, we only lazyload explicitly, version is unstable
  defaults = { lazy = false, version = false },

  -- Lazy will check if there is updates when we start up
  checker = { enabled = true },
})
