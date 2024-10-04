return {
	{
		"voldikss/vim-translator",
		lazy = true,
		cmd = { "Translate" },
		config = function()
			require("vim-translator").setup()
		end,
	},
}
