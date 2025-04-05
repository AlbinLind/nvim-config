vim.api.nvim_create_autocmd("Filetype", {
  pattern = "python",
  command = "set colorcolumn=100",
})
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "latex",
  command = "set textwidth=80",
})
