-- Basic Settings
vim.o.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2


-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
require("config.lazy")

