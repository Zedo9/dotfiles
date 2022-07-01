-- local colorscheme = "gruvbox-flat"  -- Use "default" if you encounter an issue
-- vim.g.gruvbox_flat_style = "hard"
-- vim.g.gruvbox_transparent = true

local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
