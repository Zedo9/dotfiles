return {
	"mfussenegger/nvim-lint",
	event = { "BufEnter" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- markdown = { "vale" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			python = { "mypy", "pylint" },
			sh = { "shellcheck" },
			-- lua = { "luacheck" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
