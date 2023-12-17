-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.foldmethod = "indent"
vim.opt.colorcolumn = "80"

vim.wo.foldlevel = 99

-- Treesitter
-- Consider using scss parser for css as described in https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
vim.treesitter.language.register("devicetree", "keymap")
