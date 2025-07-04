return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["I BS"] = "", -- disable backspace mapping (Avoid conflict with nvim-autopairs)
		}
	end,
}
