return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').setup()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local buf = args.buf
                    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
                    if lang then
                        pcall(vim.treesitter.start, buf, lang)
                    end
                end
            })
        end
    }
}
