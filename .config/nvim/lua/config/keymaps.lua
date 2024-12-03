-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Move to window using the <ctrl> arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
-- map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-Don>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- Resize windows
map("n", "<C-A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map("t", "<esc><esc>", "<C-\\><C-N>", { desc = "Exit terminal focus" })
