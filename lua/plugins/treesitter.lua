return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
          local parsers = {
              "c",
              "go",
              "html",
              "markdown",
              "markdown_inline",
              "javascript",
              "json",
              "lua",
              "typescript",
              "vim",
              "vimdoc",
          }

          require("nvim-treesitter").install(parsers)

          vim.api.nvim_create_autocmd("FileType", {
              pattern = {
                  "c", "go", "html", "markdown",
                  "javascript", "json", "lua",
                  "typescript", "vim", "help",
              },
              callback = function ()
                vim.treesitter.start()
              end,
          })
        end
    }
}
