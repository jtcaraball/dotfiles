local function border(hl_name)
	return {
		{ '╭', hl_name },
		{ '─', hl_name },
		{ '╮', hl_name },
		{ '│', hl_name },
		{ '╯', hl_name },
		{ '─', hl_name },
		{ '╰', hl_name },
		{ '│', hl_name },
	}
end

local options = {
	PATH = 'skip',

	ui = {
		icons = {
			package_pending = ' ',
			package_installed = ' ',
			package_uninstalled = ' ',
		},
		border = border 'CmpDocBorder'
	},

	max_concurrent_installers = 10,
}

return {
	'williamboman/mason.nvim',
	commit = '57e5a8a',
	cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
	opts = function()
		return options
	end,
}
