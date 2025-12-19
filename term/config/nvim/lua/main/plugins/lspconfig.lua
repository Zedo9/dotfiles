return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",

		-- Mason
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		-- Update file imports on rename
		{ "antosha417/nvim-lsp-file-operations", config = true },

		-- neovim completions
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event, bufnr)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")

				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				map("K", vim.lsp.buf.hover, "Hover Documentation")

				map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
				vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = false,
			virtual_lines = {
				source = "if_many",
				current_line = true,
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})
		local servers = {
			bashls = {},
			dockerls = {},
			rust_analyzer = {},

			-- tailwindcss = {},

			-- astro = {},

			-- texlab = {
			-- 	settings = {
			-- 		texlab = {
			-- 			build = {
			-- 				onSave = true,
			-- 			},
			-- 		},
			-- 	},
			-- },

			-- gopls = {},
			pyright = {},

			-- rust_analyzer = {},

			typos_lsp = {},
			tsserver = {},

			eslint = {
				filetypes = {
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"javascript",
					"javascriptreact",
					"javascript.jsx",
				},
				settings = {
					codeActionOnSave = {
						enable = true,
						mode = "all",
					},
				},
				single_file_support = true,
			},

			docker_compose_language_service = {},

			-- omnisharp = {
			-- 	enable_editorconfig_support = true,
			-- 	enable_ms_build_load_projects_on_demand = false,
			-- 	enable_roslyn_analyzers = true,
			-- 	organize_imports_on_format = true,
			-- 	enable_import_completion = true,
			-- 	sdk_include_prereleases = true,
			-- 	analyze_open_documents_only = false,
			-- },

			-- csharp_ls = {},

			emmet_ls = {
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
				},
			},

			json_ls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},

			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
						telemetry = { enable = false },
					},
				},
			},
		}

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettierd",
				"shfmt",
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
