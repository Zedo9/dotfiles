-- Set highlight on search
vim.o.hlsearch = true
-- incremental search
vim.o.incsearch = true

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
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- convert tabs to spaces
vim.o.expandtab = true
vim.o.smartindent = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.wo.signcolumn = "yes"
vim.o.colorcolumn = "80"

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.wrap = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.splitbelow = true
vim.o.splitright = true

-- highlight the current line
vim.opt.cursorline = true

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showtabline = 2 -- 2: Always | 1: Only when >1 tab | 0 : Never
