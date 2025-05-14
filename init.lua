require("config.lazy")

-- Options.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.wildmenu = true
vim.o.mouse = a
vim.o.signcolumn = "yes"

-- Temporary fix for flicker using splits. Seems to happen only in markdonw
-- fils?
-- https://github.com/neovim/neovim/issues/32660#issuecomment-2692738191
vim.g._ts_force_sync_parsing = true

-- Commands.
vim.cmd("syntax enable")

-- LSP
local lspconfig = require("lspconfig")

-- Enable gopls
lspconfig.gopls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Completion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})


-- Typescript / JavaScript completion
require("typescript-tools").setup({})
