return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"gbprod/none-ls-shellcheck.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.diagnostics.pylint,
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
			},
		})
	end,
}
