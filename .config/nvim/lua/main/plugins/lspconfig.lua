return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- Update file imports on rename
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			nmap("<leader>sd", require("telescope.builtin").diagnostics, "[S]earch [D]iagnostics")
			nmap("<leader>fd", vim.diagnostic.open_float, "Show line diagnostics")

			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })
			nmap("<leader>ff", ":Format<CR>", "[F]ormat [F]ile")

			-- Lesser used LSP functionality
			-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
			-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["texlab"].setup({
			texlab = {
				build = {
					onSave = true,
				},
			},
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					telemetry = { enable = false },
				},
			},
		})
	end,
}
