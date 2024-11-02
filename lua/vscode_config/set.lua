-- We automatically load this file from init.lua

-- Enable automatically formatting
vim.g.autoformat = true

-- Find root directory
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }


local opt = vim.opt


opt.clipboard:append("unnamedplus") -- Sync with system clipboard
vim.g.clipboard = vim.g.vscode_clipboard
opt.completeopt = "menu,menuone,noselect" -- Autocomplet menu
opt.cursorline = true -- Enable highlighting of the current lines
opt.expandtab = true -- Use spaces instead of tabs
-- Format options:
-- j. Remove unnecessary double comments
-- c. Autowrap comments
-- r. Automatically add a comment leader after hitting Enter
-- q. Format comments
-- l. Long lines are not broken in insert mode
-- n. Recognize numbered lists
-- t. Autowrap text
opt.formatoptions = "jcrqlnt"
-- Grep file name, line number, column number, error message?
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep" -- Custom grepformat
opt.ignorecase = true -- Ignore cases when searching
opt.laststatus = 2 -- Constantly a status line
opt.list = true -- Show some invisible characters
opt.number = true -- Enable numers
opt.relativenumber = true -- Enable relative numbers
opt.pumblend = 30 -- 100 - x % opaque popup
opt.pumheight = 10 -- Max items to displays
opt.scrolloff = 12 -- When moving keep 8 lines to top and bottom
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of contexts
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each 14:16
opt.smartcase = true -- Don't ignore case with case
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en", "sv" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
