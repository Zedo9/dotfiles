return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"gbprod/none-ls-shellcheck.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		-- local null_ls_utils = require("null-ls.utils")

		null_ls.setup({
			-- root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				-- null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.diagnostics.pylint,
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
			},
		})
	end,
}
