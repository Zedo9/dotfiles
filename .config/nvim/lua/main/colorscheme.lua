-- local colorscheme = "gruvbox-flat"  -- Use "default" if you encounter an issue
-- vim.g.gruvbox_flat_style = "hard"
-- vim.g.gruvbox_transparent = true

local colorscheme = "darkplus"
-- local colorscheme = "darcula-solid"
vim.g.transparent_background = true

--local status_ok, onedarkpro = pcall(require, "onedarkpro")
--if not status_ok then
--  return
--end
--
--onedarkpro.setup {
--  theme = "onedark_vivid",
--  options = {
--      bold = true, -- Use the themes opinionated bold styles?
--      italic = true, -- Use the themes opinionated italic styles?
--      underline = true, -- Use the themes opinionated underline styles?
--      undercurl = true, -- Use the themes opinionated undercurl styles?
--      cursorline = true, -- Use cursorline highlighting?
--      transparency = true, -- Use a transparent background?
--      terminal_colors = true -- Use the theme's colors for Neovim's :terminal?
--  }
--}
-- local colorscheme = "onedarkpro"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
