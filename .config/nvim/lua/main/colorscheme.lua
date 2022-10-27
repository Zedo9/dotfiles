local colorscheme = "gruvbox-baby"
vim.g.gruvbox_baby_transparent_mode = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
