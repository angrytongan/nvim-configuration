require("config.lazy")

-- Options.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
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
