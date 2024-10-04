return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = {
			"Telescope buffers",
			"Telescope help_tags",
			"Telescope oldfiles",
			"Telescope file_browser",
			"Telescope live_grep_args",
			"Telescope find_files",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{
				"<leader>fw",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				desc = "Live grep",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
			{ "<leader>f?", "<cmd>Telescope oldfiles<CR>", desc = "Old files" },
			{ "<leader>fb", "<cmd>Telescope file_browser<CR>", desc = "File browser" },
			{ "<leader>ft", "<cmd>lua require('trouble.sources.telescope').open()<CR>", desc = "trouble" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					file_browser = {
						theme = "ivy",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							["i"] = {
								-- your custom insert mode mappings
							},
							["n"] = {
								-- your custom normal mode mappings
							},
						},
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("bookmarks")
		end,
	},
}
