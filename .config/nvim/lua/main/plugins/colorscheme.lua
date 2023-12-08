return {
	-- "luisiacc/gruvbox-baby",
	"Mofiqul/vscode.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- vim.g.gruvbox_baby_transparent_mode = 1
		-- vim.cmd.colorscheme("gruvbox-baby")

		local vscode = require("vscode")
		vscode.setup({
			style = "dark",
			transparent = true,
			italic_comments = true,
			disable_nvimtree_bg = true,
		})
		vscode.load()
	end,
}
