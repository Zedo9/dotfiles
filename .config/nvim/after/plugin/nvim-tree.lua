vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = 30,
    side = "right"
  },
  filters = {
    dotfiles = false
  }
})

vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>")
