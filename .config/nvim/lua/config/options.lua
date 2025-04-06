-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.foldmethod = "indent"
vim.opt.colorcolumn = "80"

if vim.fn.has("wsl") == 1 then
  -- Taken from https://neovim.io/doc/user/provider.html#clipboard-wsl
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.wo.foldlevel = 99

-- Treesitter
-- Consider using scss parser for css as described in https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
vim.treesitter.language.register("devicetree", "keymap")

-- Use git as root dir detection mechanism instead of LSP (e.g. for monorepos)
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

vim.diagnostic.config({
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
