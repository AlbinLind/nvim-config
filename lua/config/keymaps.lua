vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

-- LSP keys
map({ "n", "v" }, "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
-- map({ "n", "v" }, "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Grep references" })
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map({ "n", "v" }, "gr", function()
  require("telescope.builtin").lsp_references({
    prompt_title = "References",
    ignore_filename = true,
  })
end, { desc = "Go to references" })
map({ "n", "v" }, "K", vim.lsp.buf.hover, { desc = "Hover over word" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "x" }, "<leader>cf", vim.lsp.buf.format, { desc = "Formats buffer" })
map({ "n", "v" }, "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map({ "n", "v" }, "<leader>ct", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map({ "n", "v" }, "<leader>cn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map({ "n", "v" }, "<leader>cp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- Open file tree
map({ "n", "v" }, "<leader>e", vim.cmd.Ex, { desc = "Open file tree" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Switch to other buffer
map("n", "<leader>b,", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Always use n to search forward and N backwards
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]'zz'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]'zz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]'zz'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]'zz'", { expr = true, desc = "Prev search result" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Jump to start and end of line
map("n", "H", "^")
map("n", "L", "$")
