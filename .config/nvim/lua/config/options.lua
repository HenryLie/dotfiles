-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Cursor crosshairs
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- Restores cursorcolumn on monokai-pro.nvim
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#161821" })

vim.o.termguicolors = true
vim.go.background = "dark"
-- vim.cmd([[highlight Normal guibg=none]])
