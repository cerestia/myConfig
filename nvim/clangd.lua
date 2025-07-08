-- 启用 Clangd LSP
local lspconfig = require('lspconfig')

lspconfig.clangd.setup{
  cmd = { "clangd", "--background-index", "--compile-commands-dir=./build" },  -- 启动参数
  on_attach = function(client, bufnr)
    -- 启用诊断信息
    vim.diagnostic.config{
      virtual_text = { severity_sort = true },
      signs = true,
      underline = true,
    }

    -- 代码跳转和重构快捷键
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    -- 自动格式化
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "lua vim.lsp.buf.formatting_sync(nil, 1000)"
    })
  e
