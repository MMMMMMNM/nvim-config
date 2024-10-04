return {
	{
		"nvim-zh/colorful-winsep.nvim",
		lazy = true,
		event = { "WinLeave" },
		opts = {
			-- highlight for Window separator
			hi = {
				bg = "#16161E",
				fg = "white",
			},
			symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
		},
	},
}
