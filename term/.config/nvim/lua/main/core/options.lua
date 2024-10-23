-- Set highlight on search
vim.o.hlsearch = true
-- incremental search
vim.o.incsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4

vim.o.backup = false
vim.o.swapfile = false
-- if a file is being edited by another program
-- (or was written to file while editing with another program),
-- it is not allowed to be edited
vim.o.writebackup = false

vim.o.cmdheight = 1
vim.o.showmode = false

-- Enable mouse mode
vim.o.mouse = "a"

vim.g.have_nerd_font = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.wo.signcolumn = "yes"

vim.o.colorcolumn = "80"

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.o.termguicolors = true

vim.o.wrap = true
vim.o.scrolloff = 10

vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.splitbelow = true
vim.o.splitright = true

-- highlight the current line
vim.opt.cursorline = true

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.showtabline = 2 -- 2: Always | 1: Only when >1 tab | 0 : Never

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces tabs count for
