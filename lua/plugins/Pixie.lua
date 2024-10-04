return {
	{
		"atlj/Pixie.nvim",
		cmd = { "PixieCopy" },
		config = function()
			require("Pixie").setup()
		end,
	},
}
