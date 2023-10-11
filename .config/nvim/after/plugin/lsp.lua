local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				vim.lsp.buf.format()
			else
				vim.lsp.buf.format({ name = "efm" })
			end
		end,
	})

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	require("lsp_signature").on_attach({}, bufnr)
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			vim.lsp.buf.format()
		else
			vim.lsp.buf.format({ name = "efm" })
		end
	end, { desc = "Format current buffer with LSP" })
	nmap("<leader>ff", ":Format<CR>", "[F]ormat [F]ile")
end

-- Enable the following language servers
local servers = {
	texlab = {
		texlab = {
			build = {
				onSave = true,
			},
		},
	},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- local cspell = require("efmls-configs.linters.cspell")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local latexindent = require("efmls-configs.formatters.latexindent")
local eslint_d = require("efmls-configs.linters.eslint_d")
local stylua = require("efmls-configs.formatters.stylua")
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")

local languages = {
	lua = { stylua },
	tex = { latexindent },
	yaml = { prettier_d },
	html = { prettier_d },
	css = { prettier_d },
	sh = { shfmt, shellcheck },
	javascript = { prettier_d, eslint_d },
	typescript = { prettier_d, eslint_d },
}

local efmls_config = {
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/" },
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
	on_attach = on_attach,
	capabilities = capabilities,
}))
