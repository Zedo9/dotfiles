local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = { 
  'sumneko_lua', 
  'tsserver', 
--'omnisharp',
--'volar',
  'bashls', 
--  'texlab', 
  'dockerls'}

lsp_installer.setup {
	automatic_installation = true,
	ensure_installed = servers
}

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wl', function()
	  vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, opts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, nil, {
    buffer = bufnr,
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
  })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
end

-- nvim-cmp supports additional completion capabilities
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

for _, server in ipairs(servers) do
	lsp_config[server].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
