require('plugins')
require('properties')
require('keymaps')
require('lsp')

vim.cmd("colorscheme tokyonight-night")
vim.api.nvim_set_hl(0, "LineNr", {fg = "#7681b0"})
-- vim.api.nvim_set_hl(0, "CocErrorHighlight", {fg = "#C53B53", bold = true, underline = true})
-- vim.api.nvim_set_hl(0, "CocWarningHighlight", {fg = "#D6A869", bold = true, underline = true})
