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

		vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
