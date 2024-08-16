local lspconfig = require "lspconfig"
local map = vim.keymap.set

-- define on_attach, on_init & capabilities
local function on_attach(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
	map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
	map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
	map(
		"n",
		"<leader>sh",
		vim.lsp.buf.signature_help,
		opts "Show signature help"
	)

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts "List workspace folders")

	map(
		"n",
		"<leader>D",
		vim.lsp.buf.type_definition,
		opts "Go to type definition"
	)
end

-- disable semanticTokens
local function on_init(client, _)
	if client.supports_method "textDocument/semanticTokens" then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local handlers = {
	["textDocument/hover"] =  vim.lsp.with(
		vim.lsp.handlers.hover,
		{border = "rounded"}
	),
	["textDocument/signatureHelp"] =  vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{border = "rounded" }
	),
}

-- setup & initialize lua for editing configs
lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
	handlers = handlers,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand "$VIMRUNTIME/lua",
					vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
					vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}

-- setup diagnostic's text
local x = vim.diagnostic.severity

vim.diagnostic.config {
	virtual_text = false,
	signs = {
		text = {
			[x.ERROR] = "󰅙",
			[x.WARN] = "",
			[x.INFO] = "󰋼",
			[x.HINT] = "󰌵",
		},
	},
	underline = true,
	float = { border = "rounded" },
}

-- configure servers
local servers = { "gopls", "texlab", "pyright" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
		handlers = handlers,
	}
end
