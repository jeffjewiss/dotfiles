-- I have to do this for visual mode
vim.keymap.set("x", "<leader>e", ":ObsidianExtractNote<cr>", { desc = "Obsidian extract" })

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>o", "", desc = "Obsidian" },
		{ "<leader>od", "", desc = "Dailies" },
		{ "<leader>odd", "<cmd>ObsidianDailies<cr>", desc = "Obsidian Dailies" },
		{ "<leader>odt", "<cmd>ObsidianToday<cr>", desc = "Today" },
		{ "<leader>odj", "<cmd>ObsidianTomorrow<cr>", desc = "Next Working Day" },
		{ "<leader>odk", "<cmd>ObsidianYesterday<cr>", desc = "Previous Working Day" },
		{ "<leader>of", "", desc = "Find" },
		{ "<leader>ofn", "<cmd>ObsidianQuickSwitch<cr>", desc = "Notes" },
		{ "<leader>oft", "<cmd>ObsidianTags<cr>", desc = "Tags" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search" },
		{ "<leader>ol", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link" },
		{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open note in Obsidian" },
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
		{ "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags" },
	},
	opts = {
		disable_frontmatter = true,
		picker = {
			name = "fzf-lua",
		},
		daily_notes = {
			folder = "Daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily" },
			template = "daily.md",
		},
		templates = {
			folder = "Templates",
			substitutions = {
				date_title = function()
					return os.date("%A, %B %d %Y")
				end,
				["date:dddd, MMMM Do YYYY"] = function()
					return os.date("%A, %B %d %Y")
				end,
			},
		},
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
		},
	},
}
