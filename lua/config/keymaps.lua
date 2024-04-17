-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local defaultOpts = { noremap = true, silent = true }

-- -- Split Window
keymap.set("n", "ss", ":split<Return>", defaultOpts)
keymap.set("n", "sv", ":vsplit<Return>", defaultOpts)
