return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = {
                    "c",
                    "go",
                    "html",
                    "markdown_inline",
                    "javascript",
                    "json",
                    "lua",
                    "typescript",
                    "vim",
                    "vimdoc",
                },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    }
}
