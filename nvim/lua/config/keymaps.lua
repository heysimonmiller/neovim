-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- mode, --new hotkey, -- old hotkey
keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- keymap.set("i", "jk", "<ESC>") --exit out of insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") --clear search

keymap.set("n", "x", '"_x') -- delete character but don't copy to register

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-j>", "<C-d>zz")
keymap.set("n", "<C-k>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--zen-mode
keymap.set("n", "<leader>zz", function()
  require("zen-mode").setup({
    window = {
      width = 120,
      options = {},
    },
  })
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = true
  vim.wo.rnu = true
end)

keymap.set("n", "<leader>zZ", function()
  require("zen-mode").setup({
    window = {
      width = 80,
      options = {},
    },
  })
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = false
  vim.wo.rnu = false
  vim.opt.colorcolumn = "0"
end)

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- keymap.set("n", "<leader>w", ":NvimTreeFocus<CR>") -- focus file explorer
