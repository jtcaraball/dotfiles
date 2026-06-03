return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	build = 'cargo build --release',
	opts = {
		cmdline = {
			keymap = {
				preset = 'inherit',
				['<Tab>'] = { 'show' },
				['<CR>'] = { 'accept_and_enter', 'fallback' },
			},
			completion = {
				menu = {
					auto_show = function ()
						local cmd = vim.fn.getcmdline()
						return vim.startswith(cmd, 'find')
					end,
				},
			},
		},
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
			accept = {
				auto_brackets = {
					enabled = false,
					kind_resolution = { enabled = false },
					semantic_token_resolution = { enabled = false },
				},
			},
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lsp = { score_offset = 9001 },
				snippets = {
					score_offset = -9001,
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= 'trigger_character'
					end
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
