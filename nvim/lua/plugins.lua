local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- 初始化 lazy.nvim 插件管理器
require('lazy').setup({
  -- 主题
   { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
   -- 目录
  { "kyazdani42/nvim-tree.lua", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },
  -- 核心依赖
  { "neovim/nvim-lspconfig" },  -- LSP 基础支持
  { "hrsh7th/nvim-cmp" },       -- 智能补全框架
  { "hrsh7th/cmp-nvim-lsp" },   -- LSP 补全源
  { "hrsh7th/cmp-buffer" },     -- 缓冲区补全
  { "hrsh7th/cmp-path" },       -- 路径补全
  { "onsails/lspkind-nvim" },   -- 补全图标
  { "williamboman/mason.nvim" }, -- 语言服务器管理
  { "williamboman/mason-lspconfig.nvim" }, -- LSP 服务器自动安装
})


