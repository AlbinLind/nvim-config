-- Keymaps for both VSCode and Neovim

vim.g.mapleader = " "

local map = vim.keymap.set
local vscode = require('vscode-neovim')

-- VSCode keymaps
map("n", "<leader>cf", function() vscode.action("editor.action.formatDocument") end, { desc = "Format" })

-- Search in all files
map("n", "<leader>ff", function() vscode.action("workbench.action.findInFiles") end, { desc = "Search in all files" })

-- Open "file tree"
map({ "n", "v" }, "<leader><leader>", vim.cmd.Ex, { desc = "Search for file" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Always use n to search forward and N backwards
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })