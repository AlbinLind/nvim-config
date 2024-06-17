return {
  "mbbill/undotree",
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
  end
}
