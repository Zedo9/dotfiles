-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
			"ray-x/lsp_signature.nvim",
			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},
	"jose-elias-alvarez/null-ls.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		version = "nightly",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		},
	},
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip" },
	},

	{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },

	"rafamadriz/friendly-snippets",

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	{ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter" },
	},
	{ -- Context
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter" },
	},

	"windwp/nvim-autopairs",
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",
	"f-person/git-blame.nvim",

	-- Colorschemes
	"luisiacc/gruvbox-baby",
	"eddyekofo94/gruvbox-flat.nvim",
	-- { 'jesseleite/nvim-noirbuddy', requires = { 'tjdevries/colorbuddy.nvim', branch = "dev" } },
	-- 'martinsione/darkplus.nvim',

	"nvim-lualine/lualine.nvim", -- Fancier statusline
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	"nvim-tree/nvim-web-devicons", -- Icons
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	"norcalli/nvim-colorizer.lua",

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		-- branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},

	"folke/which-key.nvim",
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
-- :checkhealth lazy
