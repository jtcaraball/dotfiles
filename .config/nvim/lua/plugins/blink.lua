return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	build = 'cargo build --release',
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'default',
		['<Tab>'] = { 'select_and_accept', 'fallback' }
	},
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},
		completion = {
		menu = { border = "rounded" },
		documentation = {
			auto_show = true,
			window = { border = "rounded" },
		},
	},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lsp = { score_offset = 9001 },
				snippets = { score_offset = -9001 },
			}
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
