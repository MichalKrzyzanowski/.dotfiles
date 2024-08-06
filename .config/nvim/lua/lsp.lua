local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.gdscript.setup {
	capabilities = capabilities
}

lspconfig.gdshader_lsp.setup {
	capabilities = capabilities
}

lspconfig.lua_ls.setup {
	capabilities = capabilities
}

lspconfig.clangd.setup {
	capabilities = capabilities
}

lspconfig.jdtls.setup {
	capabilities = capabilities
}

lspconfig.pyright.setup {
	capabilities = capabilities
}

lspconfig.bashls.setup {
	capabilities = capabilities
}

lspconfig.vimls.setup {
	capabilities = capabilities
}
