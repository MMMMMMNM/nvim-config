return {
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
	{
		"binhtran432k/dracula.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
