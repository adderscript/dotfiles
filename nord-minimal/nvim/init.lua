-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.shell = "/bin/bash"

vim.keymap.set("v", "d", '"_d')
vim.keymap.set("v", "p", '"_dP')
