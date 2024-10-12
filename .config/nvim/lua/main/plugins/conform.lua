return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>ff",
			function()
				require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 2000 })
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
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 2000, lsp_fallback = true, async = false }
		end,
	},
	init = function()
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
