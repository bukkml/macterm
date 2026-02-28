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

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
});

vim.keymap.set("n", "<leader>ud", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
