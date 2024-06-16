-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = "," -- set leader key
vim.opt.expandtab = false -- use tabs over spaces
vim.g.root_spec = { "lsp", { ".git", "lua", "Makefile" }, "cwd" }
