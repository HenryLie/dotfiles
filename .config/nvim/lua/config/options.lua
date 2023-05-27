-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Cursor crosshairs

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
--
vim.opt.colorcolumn = "80"

vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 0, bg = "#161821" })
-- Restores cursorcolumn on monokai-pro.nvim
-- vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#c3c3c3", fg = "#ffffff" })
-- vim.api.nvim_command("redraw")
--
vim.o.termguicolors = true
-- vim.go.background = "dark"

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
