return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip", -- optional for snippet support
        },
    },
}
