return {
	"echasnovski/mini.nvim",
	config = function()
		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		statusline.setup()

		-- statusline.section_location = function()
		-- 	return ""
		-- end
	end,
}
