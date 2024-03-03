return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		enable = true,
		snippet_engine = "luasnip",
	},
	config = function(_, opts)
		require("neogen").setup(opts)
	end,
}
