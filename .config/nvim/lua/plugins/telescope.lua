local ns_id = vim.api.nvim_create_namespace('fzf_live_jump_hl')

local function clear_hl(buf)
	vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1) -- clear highlight.
end

local function update_cursor(state, win, buf)
	local selection = state.get_selected_entry()
	if selection and selection.lnum then
		vim.api.nvim_win_set_cursor(win, { selection.lnum, 0 })
		vim.api.nvim_win_call(win, function() vim.cmd('normal! zz') end)
		clear_hl(buf)
		vim.hl.range(
			buf,
			ns_id,
			'Visual',
			{ selection.lnum - 1, 0 },
			{ selection.lnum - 1, -1 }
		)
	end
end

local function restore_cursor(actions, prompt_bufnr, win, cursor)
	vim.api.nvim_win_set_cursor(win, cursor)
	vim.api.nvim_win_call(win, function() vim.cmd('normal! zz') end)
	actions.close(prompt_bufnr)
end

local function fuzzy_find_with_live_jump()
	local builtin = require('telescope.builtin')
	local actions = require('telescope.actions')
	local state = require('telescope.actions.state')

	local org_win = vim.api.nvim_get_current_win()
	local org_buf = vim.api.nvim_win_get_buf(org_win)
	local org_cursor = vim.api.nvim_win_get_cursor(org_win)

	builtin.current_buffer_fuzzy_find({
		on_input_filter_cb = (
			function()
				vim.schedule(function() update_cursor(state, org_win, org_buf) end)
			end
		),
		attach_mappings = function(prompt_bufnr, map)
			actions.move_selection_next:enhance({
				post = function() update_cursor(state, org_win, org_buf) end
			})
			actions.move_selection_previous:enhance({
				post = function() update_cursor(state, org_win, org_buf) end
			})
			map({ 'i', 'n' }, '<CR>', function()
				clear_hl(org_buf)
				actions.select_default(prompt_bufnr)
			end)
			map({ 'i', 'n' }, '<Esc>', function()
				clear_hl(org_buf)
				restore_cursor(actions, prompt_bufnr, org_win, org_cursor)
			end)
			map({ 'i', 'n' }, '<C-c>', function()
				clear_hl(org_buf)
				restore_cursor(actions, prompt_bufnr, org_win, org_cursor)
			end)
			return true
		end,
	})
end

local function explore_find_files()
	local builtin = require('telescope.builtin')
	builtin.find_files({
		find_command = {
			-- Command.
			'fd', '--type', 'f', '--color', 'never',
			-- Set explore juce.
			'--base-directory', vim.fn.expand('~'), '-a',
			-- Ignores.
			'-E', '.git', '-E', 'node_modules', '-E', 'target',
		},
		prompt_title = 'Explore',
	})
end

local function find_all()
	local builtin = require('telescope.builtin')
	builtin.find_files({
		find_command = {
			-- Command.
			'fd', '--type', 'f', '--color', 'never',
			-- Hidden.
			'-u',
			-- Ignores.
			'-E', '.git', '-E', 'node_modules', '-E', 'target',
		},
		prompt_title = 'Explore'
	})
end

return {
	'nvim-telescope/telescope.nvim',
	commit = '7d32479',
	command = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			'<leader>ff',
			'<cmd>Telescope find_files<CR>',
			mode = 'n',
			desc = 'Find files',
		},
		{
			'<leader>fz',
			'<cmd>Telescope live_grep<CR>',
			mode = 'n',
			desc = 'Fuzzy over files',
		},
		{
			'<leader>fa',
			find_all,
			mode = 'n',
			desc = 'Find all files',
		},
		{
			'<leader>fe',
			explore_find_files,
			mode = 'n',
			desc = 'Fuzzy find from home',
		},
		{
			'<leader>f/',
			fuzzy_find_with_live_jump,
			mode = 'n',
			desc = 'Fuzzy find in buffer',
		},
	},
	opts = {
		defaults = {
			prompt_prefix = ' 🔭 ',
			selection_caret = ' ',
		},
		pickers = {
			find_files = {
				find_command = {
					-- Command.
					'fd', '--type', 'f', '--color', 'never',
					-- Ignores.
					'-E', '.git', '-E', 'node_modules', '-E', 'target',
					-- Sorting.
					'-X', 'ls', '-t1',
				},
				-- We have Ivy theme at home.
				previewer = false,
				results_title = "",
				sorting_strategy = "ascending",
				layout_strategy = "bottom_pane",
				layout_config = {
					height = 10,
				},
				border = true,
				borderchars = {
					prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			},
			current_buffer_fuzzy_find = {
				-- We have Ivy theme at home.
				previewer = false,
				results_title = "",
				sorting_strategy = "ascending",
				layout_strategy = "bottom_pane",
				layout_config = {
					height = 10,
				},
				border = true,
				borderchars = {
					prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			}
		},
	}
}
