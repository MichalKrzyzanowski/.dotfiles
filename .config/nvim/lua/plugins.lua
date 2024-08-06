local Plug = vim.fn["plug#"]
vim.call("plug#begin")

-- themes
Plug("vim-scripts/twilight256.vim", {as = 'twilight'})
Plug("christophermca/meta5", {as = 'meta5'})
Plug("joshdick/onedark.vim", {as = 'oneDark'})
Plug("folke/tokyonight.nvim", {as = 'tokyonight'})

-- general
Plug("tpope/vim-surround")
Plug('tpope/vim-fugitive')
Plug('tpope/vim-commentary')
Plug("preservim/nerdtree")
Plug("tpope/vim-abolish")
Plug("jiangmiao/auto-pairs")
-- Plug("nvim-treesitter/nvim-treesitter")
Plug("nvim-tree/nvim-web-devicons")
Plug("akinsho/bufferline.nvim", {tag = '*'})
Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")
-- Plug("wfxr/minimap.vim")
Plug("moll/vim-bbye")
Plug("nvimdev/dashboard-nvim")
Plug("dhruvasagar/vim-table-mode")

-- lcp plugins
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

vim.call("plug#end")

-- require('nvim-treesitter.configs').setup
-- {
--     highlight = {
--         enabled = true,
--         additional_vim_regex_highlighting = false,
--     },
-- }

require("bufferline").setup({
	options = {
		themable = false,
		separator_style = "thin",
	},
})

require("dashboard").setup({
	config = {
		week_header = {
			enable = true,
		},
	},
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({select = true}),
		["<Tab>"] = cmp.mapping.confirm({select = true}),
	}),
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "luasnip"},
		{name = "path"},
	}, {
		{name = "buffer"},
	})
})

-- cmp.setup.cmdline({"/", "?"}, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{name = "buffer"}
-- 	})
-- })

-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{name = "path"},
-- 		{name = "cmdline"}
-- 	}),
-- 	matching = {disallow_symbol_nonprefix_matching = false}
-- })
