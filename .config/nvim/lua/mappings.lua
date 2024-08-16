local map = vim.keymap.set

-- tpop is always first
map(
	"n",
	"<leader>Gs",
	"<cmd>G<CR><C-w>k<cmd>q<CR>",
	{ desc = "full git status" }
)
map(
	"n",
	"<leader>Gd",
	"<cmd>Gvdiffsplit<CR>",
	{ desc = "full git status" }
)

-- navigation
map("n", "<leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>l", "<C-w>l", { desc = "switch window right" })
map("n", "<leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<leader>k", "<C-w>k", { desc = "switch window up" })
map(
	"n",
	"<leader>vs",
	":vsplit<CR>",
	{ desc = "switch window up", silent = true }
)
map(
	"n",
	"<leader>hs",
	":split<CR>",
	{ desc = "switch window up", silent = true }
)

-- netrw
map(
	"n",
	"<leader>nt",
	":Ex<CR>",
	{ desc = "open netrw", silent = true }
)

-- for old times sake
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")

-- global lsp mappings
map(
	"n",
	"<leader>ds",
	vim.diagnostic.setloclist,
	{ desc = "lsp diagnostic loclist" }
)

-- miscellaneous
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map({"n", "v"}, "<leader>y", [["+y]], { desc = "yank to system's clipboard" } )
map({"n"}, "<leader>Y", [["+Y]], { desc = "YANK to system's clipboard" } )

-- TSJToggle
map(
	"n",
	"<leader>ss",
	require("treesj").toggle,
	{ desc = "split function", silent = true }
)

-- conform
map("n", "<leader>fm", function()
	require("conform").format { lsp_fallback = true }
end, { desc = "format file" })

-- telescope
map(
	"n",
	"<leader>fw",
	"<cmd>Telescope live_grep<CR>",
	{ desc = "telescope live grep" }
)
map(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers<CR>",
	{ desc = "telescope find buffers" }
)
map(
	"n",
	"<leader>fh",
	"<cmd>Telescope help_tags<CR>",
	{ desc = "telescope help page" }
)
map(
	"n",
	"<leader>ma",
	"<cmd>Telescope marks<CR>",
	{ desc = "telescope find marks" }
)
map(
	"n",
	"<leader>fo",
	"<cmd>Telescope oldfiles<CR>",
	{ desc = "telescope find oldfiles" }
)
map(
	"n",
	"<leader>fz",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ desc = "telescope find in current buffer" }
)
map(
	"n",
	"<leader>cm",
	"<cmd>Telescope git_commits<CR>",
	{ desc = "telescope git commits" }
)
map(
	"n",
	"<leader>gt",
	"<cmd>Telescope git_status<CR>",
	{ desc = "telescope git status" }
)
map(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files<cr>",
	{ desc = "telescope find files" }
)
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
