return {
	{
		"MeanderingProgrammer/markdown.nvim",
		lazy = true,
		ft = "markdown",
		main = "render-markdown",
		opts = {},
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	},
}
