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
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"ray-x/lsp_signature.nvim",
			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		version = "nightly",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		},
	},
	{
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
	"nvim-lualine/lualine.nvim", -- Fancier statusline
	'nanozuki/tabby.nvim',
	"nvim-tree/nvim-web-devicons",
	"numToStr/Comment.nvim",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"tpope/vim-sleuth",

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
