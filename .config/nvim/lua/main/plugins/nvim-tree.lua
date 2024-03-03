return {
	"nvim-tree/nvim-tree.lua",
	-- lazy = false,
	-- version = "nightly",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "right",
			},
			filters = {
				dotfiles = false,
			},
		})

		vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>")
	end,
}
