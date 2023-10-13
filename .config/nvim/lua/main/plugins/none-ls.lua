return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.latexindent,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.code_actions.eslint_d,
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
