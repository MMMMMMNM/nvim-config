return {
	{
		"declancm/cinnamon.nvim",
		event = "BufAdd",
		version = "*", -- use latest release
		opts = { -- Enable all provided keymaps
			keymaps = {
				basic = true,
				extra = true,
			},
			-- Only scroll the window
			options = { mode = "window" },
		},
	},
}
