vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
        }
    }
})

vim.lsp.config('clangd', {
    filetypes = { 'c', 'h', 'cpp', 'objc', 'objcpp', 'cuda' },
})
