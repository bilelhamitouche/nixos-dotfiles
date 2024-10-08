require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd", "rustywind" },
		typescript = { "prettierd", "rustywind" },
		javascriptreact = { "prettierd", "rustywind" },
		typescriptreact = { "prettierd", "rustywind" },
		vue = { "prettierd", "rustywind" },
		svelte = { "prettierd", "rustywind" },
		astro = { "prettierd", "rustywind" },
		css = { "prettierd" },
		html = { "prettierd", "rustywind" },
		yaml = { "prettierd" },
		scss = { "prettierd" },
		markdown = { "prettierd" },
		liquid = { "prettierd" },
		python = { "isort", "black" },
		ruby = { "rubocop" },
		rust = { "rustfmt" },
		bash = { "shfmt" },
		php = { "php_cs_fixer" },
		lua = { "stylua" },
		json = { "prettierd" },
		nix = { "nixfmt" },
	},
	format_on_save = {
		timeout = 500,
		lsp_format = "fallback",
	},
})
