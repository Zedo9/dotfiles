-- Set highlight on search
vim.o.hlsearch = true
-- incremental search
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
-- set relative numbered lines
vim.o.relativenumber = true
vim.o.numberwidth = 4

-- creates a backup file
vim.o.backup = false
-- creates a swapfile
vim.o.swapfile = false
-- enable persistent undo
vim.o.undofile = true
-- if a file is being edited by another program
-- (or was written to file while editing with another program),
-- it is not allowed to be edited
vim.o.writebackup = false

vim.o.cmdheight = 1
vim.o.showmode = false

-- Enable mouse mode
vim.o.mouse = "a"

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
-- make indenting smarter again
vim.o.smartindent = true

-- Decrease update time
vim.o.updatetime = 2500

vim.wo.signcolumn = "yes"

vim.o.colorcolumn = "80"

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"

-- Better colors
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.wrap = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- force all horizontal splits to go below current window
-- force all vertical splits to go to the right of current window
vim.o.splitbelow = true
vim.o.splitright = true

-- highlight the current line
vim.opt.cursorline = true

vim.g.gitblame_enabled = 0
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showtabline = 2                         -- always show tabs
