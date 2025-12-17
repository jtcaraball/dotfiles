local version = vim.version()

local function dashboardhl ()
	vim.api.nvim_set_hl(0, "DashboardLogo1", { fg = "#143F6B" })
	vim.api.nvim_set_hl(0, "DashboardLogo2", { fg = "#344268" })
	vim.api.nvim_set_hl(0, "DashboardLogo3", { fg = "#544564" })
	vim.api.nvim_set_hl(0, "DashboardLogo4", { fg = "#744861" })
	vim.api.nvim_set_hl(0, "DashboardLogo5", { fg = "#954A5D" })
	vim.api.nvim_set_hl(0, "DashboardLogo6", { fg = "#B54D5A" })
	vim.api.nvim_set_hl(0, "DashboardLogo7", { fg = "#D55056" })
	vim.api.nvim_set_hl(0, "DashboardLogo8", { fg = "#F55353" })
end

local dashboard_opts = {
	sections = {
		{ text = { [[                                                                   ]], hl = "DashboardLogo1" }, align = "center" },
		{ text = { [[      ████ ██████           █████      ██                    ]], hl = "DashboardLogo2" }, align = "center" },
		{ text = { [[     ███████████             █████                            ]], hl = "DashboardLogo3" }, align = "center" },
		{ text = { [[     █████████ ███████████████████ ███   ███████████  ]], hl = "DashboardLogo4" }, align = "center" },
		{ text = { [[    █████████  ███    █████████████ █████ ██████████████  ]], hl = "DashboardLogo5" }, align = "center" },
		{ text = { [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]], hl = "DashboardLogo6" }, align = "center" },
		{ text = { [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]], hl = "DashboardLogo7" }, align = "center" },
		{ text = { [[██████  █████████████████████ ████ █████ █████ ████ ██████]], hl = "DashboardLogo8" }, align = "center" },
		{ padding = 5 },
		{ text = { "- v" .. version.major .. "." .. version.minor .. "." .. version.patch .. " -", hl = "Comment" }, align = "center" },
	},
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function ()
		dashboardhl()
	end,
	opts = {
		dashboard = dashboard_opts,
		picker = {
			enbaled = true,
			layout = {
				border = "none",
				fullscreen = true,
			},
		},
		bigfile = { enabled = true }
	},
	keys = {
		{ "<leader>ff", function () Snacks.picker.smart() end, desc = "Find Files" },
		{ "<leader>fa", function () Snacks.picker.files({hidden = true}) end, desc = "Find Hiden Files" },
		{ "<leader>fw", function () Snacks.picker.grep() end, desc = "Grep Files" },
		{ "<leader>fb", function () Snacks.picker.buffers() end, desc = "Find Buffers" },
		{ "<leader>fr", function () Snacks.picker.recent() end, desc = "Find Recent Files" },
	}
}
