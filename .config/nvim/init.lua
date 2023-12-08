require("main.core")
-- If we're using VSCODE, no need for plugins
if vim.g.vscode then
	return
end

require("main.lazy")

if vim.g.neovide then
	require("main.neovide")
end
