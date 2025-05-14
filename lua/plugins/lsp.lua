return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
          require("lspconfig").ols.setup({
            cmd = { "ols" },
            filetypes = { "odin" },
            root_dir = require("lspconfig.util").root_pattern("ols.json", ".git"),
          })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip", -- optional for snippet support
        },
    },
}
