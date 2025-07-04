return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- Conform will run multiple formatters sequentially
			["python"] = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			-- javascript = { { "prettierdd", "prettier" } },
			["javascript"] = { "prettierd", "prettier", stop_after_first = true },
			["javascriptreact"] = { "prettierd", "prettier", stop_after_first = true },
			["typescript"] = { "prettierd", "prettier", stop_after_first = true },
			["typescriptreact"] = { "prettierd", "prettier", stop_after_first = true },
			["vue"] = { "prettierd", "prettier", stop_after_first = true },
			["css"] = { "prettierd", "prettier", stop_after_first = true },
			["scss"] = { "prettierd", "prettier", stop_after_first = true },
			["less"] = { "prettierd", "prettier", stop_after_first = true },
			["html"] = { "prettierd", "prettier", stop_after_first = true },
			["json"] = { "prettierd", "prettier", stop_after_first = true },
			["jsonc"] = { "prettierd", "prettier", stop_after_first = true },
			["yaml"] = { "prettierd", "prettier", stop_after_first = true },
			["markdown"] = { "prettierd", "prettier", stop_after_first = true },
			["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },
			["graphql"] = { "prettierd", "prettier", stop_after_first = true },
			["handlebars"] = { "prettierd", "prettier", stop_after_first = true },
			["astro"] = { "prettierd", "prettier", stop_after_first = true },
			["lua"] = { "stylua" },
			["tex"] = { "latexindent" },
			["sh"] = { "shfmt", "shellcheck" },
			["cs"] = { "csharpier" },
		},
		format_on_save = function(bufnr)
			-- local disable_filetypes = { c = true, cpp = true }
			local disable_filetypes = {}
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
	},
}
