local cmp = require "cmp"

local formatting_style = {
	-- default fields order i.e completion word + item.kind + item.kind icons
	fields = { "abbr", "kind", "menu" },

	format = function(_, item)
		local icons = require "icons.lspkind"
		local icon = icons[item.kind]
		item.kind = string.format("%s %s", icon, item.kind)
		return item
	end,
}

local options = {
	completion = {
		completeopt = "menu,menuone",
	},

	formatting = formatting_style,

	window = {
		completion = {
			side_padding = 0,
			-- border = border "CmpDocBorder",
			border = "rounded",
			winhighlight = "CursorLine:CmpSel,Search:None",
			scrollbar = false,
		},
		documentation = {
			-- border = border "CmpDocBorder",
			border = "rounded",
			winhighlight = "Normal:CmpDoc",
		},
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),

		["<Tab>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

return options
