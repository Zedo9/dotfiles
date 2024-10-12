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
			["javascript"] = { { "prettierd", "prettier" } },
			["javascriptreact"] = { { "prettierd", "prettier" } },
			["typescript"] = { { "prettierd", "prettier" } },
			["typescriptreact"] = { { "prettierd", "prettier" } },
			["vue"] = { { "prettierd", "prettier" } },
			["css"] = { { "prettierd", "prettier" } },
			["scss"] = { { "prettierd", "prettier" } },
			["less"] = { { "prettierd", "prettier" } },
			["html"] = { { "prettierd", "prettier" } },
			["json"] = { { "prettierd", "prettier" } },
			["jsonc"] = { { "prettierd", "prettier" } },
			["yaml"] = { { "prettierd", "prettier" } },
			["markdown"] = { { "prettierd", "prettier" } },
			["markdown.mdx"] = { { "prettierd", "prettier" } },
			["graphql"] = { { "prettierd", "prettier" } },
			["handlebars"] = { { "prettierd", "prettier" } },
			["astro"] = { { "prettierd", "prettier" } },
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
