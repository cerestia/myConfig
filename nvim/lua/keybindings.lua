vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- windows 分屏快捷键
map("n", "vs", ":vsp<CR>", opt)
map("n", "vh", ":sp<CR>", opt)

-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opt)
-- 调整窗口大小

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- nvim-tree
local pluginKeys = {}

pluginKeys.nvimTree = {
	{ key = "<F5>", action = "refresh" },
}
