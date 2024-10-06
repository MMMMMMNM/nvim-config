return {
	{
		"pogyomo/winresize.nvim",
		keys = {
			{ "<leader>rh", "<C-w><" },
			{ "<leader>rj", "<C-w>+" },
			{ "<leader>rk", "<C-w>-" },
			{ "<leader>rl", "<C-w>>" },
		},
		config = function()
			require("winresize").setup()
		end,
	},
}
