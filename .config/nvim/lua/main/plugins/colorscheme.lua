return {
	"luisiacc/gruvbox-baby",
	-- "folke/tokyonight.nvim",
	-- "sainnhe/gruvbox-material",
	lazy = false,
	opts = {},
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.g.gruvbox_baby_transparent_mode = 1
		vim.g.gruvbox_baby_background_color = "dark"
		vim.cmd.colorscheme("gruvbox-baby")

		-- vim.opt.background = "dark" -- dark, light
		-- vim.g.gruvbox_material_background = "hard" -- hard, medium, soft
		-- vim.g.gruvbox_material_transparent_background = 2 -- 0, 1, 2
		-- vim.g.gruvbox_material_foreground = "original" -- mix, original, material
		-- vim.cmd.colorscheme("gruvbox-material")
	end,
}
