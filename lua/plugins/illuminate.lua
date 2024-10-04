return {
	{
		"RRethy/vim-illuminate",
		enabled = false,
		event = "VeryLazy",
		config = function()
			require("illuminate").setup()
		end,
	},
}
