return {
	{
		"rhysd/accelerated-jk",
		enabled = false,
		keys = {
			{ "j", "<Plug>(accelerated_jk_gj)" },
			{ "k", "<Plug>(accelerated_jk_gk)" },
		},
		config = function()
			require("accelerated_jk").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false,
		},
	},
	{
		"ethanholz/nvim-lastplace",
		evebt = "VeryLazy",
		config = true,
	},
	{
		"kamykn/spelunker.vim",
		event = "InsertEnter",
		config = function()
			vim.g.spelunker_check_type = 2
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "InsertEnter",
		config = true,
	},
}
