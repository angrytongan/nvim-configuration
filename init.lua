require("config.lazy")
require("config.diminactive").setup()

-- Options.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.wildmenu = true
vim.o.mouse = a
vim.o.signcolumn = "yes"
vim.o.ea = false
vim.opt.clipboard:append("unnamedplus")

-- Temporary fix for flicker using splits. Seems to happen only in markdonw
-- fils?
-- https://github.com/neovim/neovim/issues/32660#issuecomment-2692738191
vim.g._ts_force_sync_parsing = true

-- Commands.
vim.cmd("syntax enable")

-- Keep visual selection after indent change.
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Enable gopls
vim.lsp.enable('gopls')
vim.lsp.enable('basedpyright')

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

-- Colourscheme.
vim.cmd.colorscheme("github_dark_high_contrast")

-- Open hints.
vim.o.updatetime = 300
local lsp_diagnostics_group = vim.api.nvim_create_augroup('GlobalLspDiagnostics', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_diagnostics_group,
	pattern = '*',
	desc = 'Auto show diagnostics on cursor hold',

	callback = function(args)
		local bufnr = args.bufnr

		vim.api.nvim_create_autocmd('CursorHold', {
			buffer = bufnr,
			desc = 'Show diagnostics float on cursor hold',
			callback = function()
				vim.diagnostic.open_float(nil, {
					focusable = false,
					scope = 'cursor',
				})
			end,
		})
	end,
})

-- Markdown wrapping.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 80
        vim.opt_local.linebreak = true
        vim.opt_local.formatoptions:append("t")
    end,
})
