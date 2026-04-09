return {
	'dmtrKovalenko/fff.nvim',
	build = function()
		local done = false
		local fatal_error = nil

		require('fff.download').build_binary(function(build_success, build_error)
			if not build_success then
				fatal_error = 'Failed to build fff.nvim binary. Build error: ' .. (build_error or 'unknown error')
			else
				vim.schedule(function()
					vim.notify('fff.nvim binary built successfully!', vim.log.levels.INFO)
				end)
			end
			done = true
		end)

		-- Block the caller (and keep the Neovim event loop alive) until the entire
		-- download-or-build chain finishes.  This is critical for lazy.nvim build
		-- hooks: lazy returns from the hook immediately after this function returns,
		-- and if Neovim exits before the final rename(tmp → libfff_nvim.{dylib,so,dll})
		-- executes, the binary is never written to disk.  vim.wait pumps the event
		-- loop so all vim.system / vim.schedule callbacks can fire.
		local timeout_ms = 1000 * 60 * 2 -- 2 minutes
		local ok, wait_err = vim.wait(timeout_ms, function() return done end, 100)
		if not ok and wait_err == -2 then error('fff.nvim: download_or_build_binary timed out') end

		if fatal_error then error(fatal_error) end
	end,
	-- No need to lazy-load with lazy.nvim.
	-- This plugin initializes itself lazily.
	lazy = false,
	keys = {
		{
			"ff", -- try it if you didn't it is a banger keybinding for a picker
			function() require('fff').find_files() end,
			desc = 'FFFind files',
		},
		{
			"fg",
			function() require('fff').live_grep() end,
			desc = 'LiFFFe grep',
		},
		{
			"fz",
			function()
				require('fff').live_grep({
					grep = {
						modes = { 'fuzzy', 'plain' }
					}
				})
			end,
			desc = 'Live fffuzy grep',
		},
		{
			"fc",
			function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,
			desc = 'Search current word',
		},
	}
}
