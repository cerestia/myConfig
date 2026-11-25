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
-- 关闭当前文件（仅当前 buffer，不影响其他文件）
map("n", "<leader>c", "<cmd>bdelete<cr>", opt)
-- 调整窗口大小

vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)

-- 终端快捷键
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal name=desktop<cr>", opt)

-- 终端模式下 <C-h/j/k/l> 直接跳转到其他窗口
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = '终端跳转到左侧窗口' })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = '终端跳转到下方窗口' })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = '终端跳转到上方窗口' })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = '终端跳转到右侧窗口' })

-- nvim-tree
local pluginKeys = {}

pluginKeys.nvimTree = {
	{ key = "<F5>", action = "refresh" },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = 'Telescope grep word under cursor' })
vim.keymap.set('n', '<leader>gw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope grep with prompt' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
