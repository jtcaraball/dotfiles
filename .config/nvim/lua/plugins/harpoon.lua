local function remove_at(index, harpoon)
	local list = harpoon:list()
	local Extensions = require("harpoon.extensions")
	local Logger = require("harpoon.logger")

	if list.items[index] then
		Logger:log(
			"HarpoonList:remove_at",
			{ item = list.items[index], index = index }
		)
		table.remove(list.items, index)
		list._length = list._length - 1
		Extensions.extensions:emit(
			Extensions.event_names.REMOVE,
			{ list = list, item = list.items[index], idx = index }
		)
	end
	return list
end

local function index_of(list, predicate)
	for i, v in ipairs(list) do
		if predicate(v) then
			return i
		end
	end
	return -1
end

local function toggle_telescope(harpoon_files, harpoon, conf)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map_fn)
			map_fn(
				"i",
				"<C-d>",
				function()
					local state = require("telescope.actions.state")
					local curr_picker = state.get_current_picker(prompt_bufnr)
					curr_picker:delete_selection(function(selection)
						local idx = index_of(harpoon_files.items, function(v)
							return v.value == selection[1]
						end)
						if idx == -1 then
							return
						end
						remove_at(idx, harpoon)
					end)
					end
			)
			return true
		end,
	}):find()
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config").values
		local map = vim.keymap.set
		harpoon:setup()
		map(
			"n",
			"<leader>ms",
			function() toggle_telescope(harpoon:list(), harpoon, conf) end,
			{ desc = "Open harpoon window" }
		)
		map(
			"n",
			"<leader>ma",
			function() harpoon:list():add() end,
			{ desc = "Add harpoon mark" }
		)
		map(
			"n",
			"<leader>mh",
			function() harpoon:list():select(1) end,
			{ desc = "Go to harpoon mark 1" }
		)
		map(
			"n",
			"<leader>mj",
			function() harpoon:list():select(2) end,
			{ desc = "Go to harpoon mark 2" }
		)
		map(
			"n",
			"<leader>mk",
			function() harpoon:list():select(3) end,
			{ desc = "Go to harpoon mark 3" }
		)
		map(
			"n",
			"<leader>ml",
			function() harpoon:list():select(4) end,
			{ desc = "Go to harpoon mark 4" }
		)
		map(
			"n",
			"<leader>mp",
			function() harpoon:list():prev() end,
			{ desc = "Go to previous harpoon mark" }
		)
		map(
			"n",
			"<leader>mn",
			function() harpoon:list():next() end,
			{ desc = "Go to next harpoon mark" }
		)
	end,
}
