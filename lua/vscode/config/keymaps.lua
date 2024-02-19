-- Keymaps for both VSCode and Neovim

vim.g.mapleader = " "

local map = vim.keymap.set
local vscode = require('vscode-neovim')

-- VSCode keymaps
map("n", "<leader>cf", function() vscode.action("editor.action.formatDocument") end, { desc = "Format" })

-- Search in all files
map("n", "<leader>ff", function() vscode.action("workbench.action.findInFiles") end, { desc = "Search in all files" })

-- VSCode open command pallet
map("n", "<leader>cp", function() vscode.action("workbench.action.showCommands") end, { desc = "Open command pallet" })

-- VSCode open certain views
map("n", "<leader>e", function() vscode.action("workbench.view.explorer") end, { desc = "Open file explorer" })
map("n", "<leader>g", function() vscode.action("workbench.view.scm") end, { desc = "Open source control" })
map("n", "<leader>ct", function() vscode.action("workbench.view.extension.test") end, { desc = "Open test explorer" })
map("n", "<leader>cd", function() vscode.action("workbench.view.debug") end, { desc = "Open debug" })
map("n", "<leader>t", function() vscode.action("workbench.action.terminal.toggleTerminal") end, { desc = "Open terminal" }) 
map("n", "<leader>sv", function() vscode.action("workbench.action.toggleSidebarVisibility") end, { desc = "Toggle sidebar" })

-- Remap :s to VSCode search and replace
map("n", "<leader>sr", function() vscode.action("editor.action.startFindReplaceAction") end, { desc = "Search and replace" })

-- Better horizontal movement
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Open "file tree"
map({ "n", "v" }, "<leader><leader>", vim.cmd.Ex, { desc = "Search for file" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Right>", function() vscode.action("workbench.action.increaseViewSize") end, { desc = "Increase window height" })
map("n", "<C-Left>", function() vscode.action("workbench.action.decreaseViewSize") end, { desc = "Decrease window height" })

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