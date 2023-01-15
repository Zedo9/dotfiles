-- set numbered lines
vim.opt.number = true
-- set relative numbered lines
vim.opt.relativenumber = true
-- set number column width to 2 {default 4}
vim.opt.numberwidth = 1

-- set term gui colors (most terminals support this)
vim.opt.termguicolors = true

-- creates a backup file
vim.opt.backup = false
-- creates a swapfile
vim.opt.swapfile = false
-- enable persistent undo
vim.opt.undofile = true
-- if a file is being edited by another program (or was written to file while editing with another program),
-- it is not allowed to be edited
vim.opt.writebackup = false

vim.opt.cmdheight = 1
vim.opt.showmode = false


-- insert 2 spaces for a tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 4
-- convert tabs to spaces
vim.opt.expandtab = true
-- smart case
vim.opt.smartcase = true
-- make indenting smarter again
vim.opt.smartindent = true

-- highlight all matches on previous search pattern
vim.opt.hlsearch = true
-- incremental search
vim.opt.incsearch = true
-- ignore case in search patterns
vim.opt.ignorecase = true

-- display lines as one long line
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- allow the mouse to be used in neovim
vim.opt.mouse = "a"

-- faster completion (4000ms default)
vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"

-- allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"

-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- force all horizontal splits to go below current window
-- force all vertical splits to go to the right of current window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- highlight the current line
vim.opt.cursorline = true

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showtabline = 2                         -- always show tabs

