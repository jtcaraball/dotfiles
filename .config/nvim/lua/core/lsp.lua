local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"clangd",
	"rust_analyzer",
	"ts_ls",
	"vue_ls",
	"texlab",
	"eslint",
	"pyright",
	"tinymist",
})

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		close_events = { "CursorMoved", "BufHidden", "WinLeave" },
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- cursor diagnostic
autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, {focus=false})
	end,
})

-- close diagnostic on buffer change
autocmd("BufFilePre", {
	pattern = "*",
	callback = function ()
		vim.diagnostic.reset()
	end,
})

-- set gq as god intended on attach
autocmd("LspAttach", {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
		vim.bo[args.buf].formatprg = nil
	end,
})

-- add lsp mappings on attach
local function opts(bufnr, desc)
	return { buffer = bufnr, desc = "LSP " .. desc }
end
autocmd("LspAttach", {
	callback = function(args)
		map(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			opts(args.buf, "Go to declaration")
		)
		map(
			"n",
			"gd",
			vim.lsp.buf.definition,
			opts(args.buf, "Go to definition")
		)
		map(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			opts(args.buf, "Go to implementation")
		)
		map(
			"n",
			"<leader>sh",
			vim.lsp.buf.signature_help,
			opts(args.buf, "Show signature help")
		)
		map(
			"n",
			"<leader>wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			opts(args.buf, "List workspace folders")
		)
		map(
			"n",
			"<leader>D",
			vim.lsp.buf.type_definition,
			opts(args.buf, "Go to type definition")
		)
	end,
})
