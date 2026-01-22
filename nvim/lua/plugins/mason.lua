return {

    -- Mason
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Mason lsp config for auto install lsp's
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls", -- Lua lsp server
                "clangd", -- C/C++ lsp server
                "markdown", -- Md lsp server
            },
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },

    -- Mason tools installer
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "clang-format",
                "clangd",
                "cpplint",
                "cspell",
                "lua-language-server",
                "markdownlint",
                "selene",
                "stylua"
            },
        },
    },

}
