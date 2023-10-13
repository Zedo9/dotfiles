return {
	"luisiacc/gruvbox-baby",
	-- "eddyekofo94/gruvbox-flat.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.g.gruvbox_baby_transparent_mode = 1
		vim.cmd.colorscheme("gruvbox-baby")

		-- vim.g.gruvbox_flat_style = "hard"
		-- vim.g.gruvbox_transparent = true
		-- vim.cmd([[colorscheme gruvbox-flat]])
	end,
}
