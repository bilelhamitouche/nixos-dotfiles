local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local project_library_path = "/home/bilel/.config/yarn/global/node_modules/@angular/language-server/"
lspconfig.angularls.setup({
	capabilities = capabilities,
	cmd = {
		"ngserver",
		"--stdio",
		"--tsProbeLocations",
		project_library_path,
		"--ngProbeLocations",
		project_library_path,
	},
	filetypes = {
		"typescript",
		"html",
		"htmlangular",
	},
})

lspconfig.astro.setup({
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
})

lspconfig.html.setup({
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.nil_ls.setup({
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
})

lspconfig.ruby_lsp.setup({
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})

lspconfig.svelte.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/bilel/.config/yarn/global/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
})

lspconfig.volar.setup({
	capabilities = capabilities,
	init_options = {
		typescript = {
			tsdk = "/home/bilel/.config/yarn/global/node_modules/typescript/lib",
		},
	},
})
