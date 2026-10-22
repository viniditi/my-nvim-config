vim.opt.number = true
vim.opt.relativenumber = true

vim.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Salva o arquivo atual" })
