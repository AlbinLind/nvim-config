vim.g.mapleader = " "

local map = vim.keymap.set
local vscode = require("vscode")

-- LSP keys
map({ "n", "v" }, "gr", function() vscode.action("editor.action.goToReferences") end, { desc = "Grep references" })
map({ "n", "v" }, "K", vim.lsp.buf.hover, { desc = "Hover over word" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "x" }, "<leader>cf", vim.lsp.buf.format, { desc = "Formats buffer" })

-- Quick fixes
map({ "n", "v" }, "<leader>ca", function() vscode.action("editor.action.quickFix") end, { desc = "Code action" })

-- Open file tree
map({ "n", "v" }, "<leader>e", function () vscode.action("workbench.view.explorer") end, { desc = "Open file tree" })
map({ "n", "v" }, "<leader>gg", function () vscode.action("workbench.view.scm") end, { desc = "Open git" })

-- Open quick search
map({ "n", "v", "x"}, "<leader><leader>", vim.cmd.Ex, {})
map({ "n", "v", "x"}, "<leader>/", function() vscode.action("workbench.action.findInFiles") end, {})

-- Show open editors
map({"n", "v", "x"}, "<leader>b", function() vscode.action("workbench.action.showEditorsInActiveGroup") end,  {})

-- -- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Always use n to search forward and N backwards
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
