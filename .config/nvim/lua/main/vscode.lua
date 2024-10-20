-- vscode = require("vscode")
-- vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
--   vscode.with_insert(function()
--     vscode.action("editor.action.addSelectionToNextFindMatch")
--   end)
-- end)


vim.keymap.set({"n", "x"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")