local plugins = {
  --"folke/which-key.nvim",
  --{ "folke/neoconf.nvim", cmd = "Neoconf" },
  --"folke/neodev.nvim",
  {'nvim-telescope/telescope.nvim', tag = '0.1.0', dependencies = { {'nvim-lua/plenary.nvim'} } },

  {'luisiacc/gruvbox-baby', lazy = true },
  {'jesseleite/nvim-noirbuddy', lazy = true, dependencies = { {'tjdevries/colorbuddy.nvim', branch = "dev"} } },
  {'martinsione/darkplus.nvim', lazy = true },
  
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  
  {'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  },
  
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  
  'lewis6991/gitsigns.nvim',
  
  'numToStr/Comment.nvim',
  
  { 'folke/which-key.nvim',
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup()
      end
  },
  {'nvim-neo-tree/neo-tree.nvim', branch = "v2.x",
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    }
  }
}

require("lazy").setup(plugins)

-- Install / Update plugins with :Lazy