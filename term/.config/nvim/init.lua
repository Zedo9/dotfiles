require("main.core")

if vim.g.vscode then
	require("main.vscode")
    return
end

require("main.lazy")

if vim.g.neovide then
	require("main.neovide")
end
