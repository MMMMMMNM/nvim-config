return {
	{
		"nvim-zh/auto-save.nvim",
        lazy = false,
		vim.keymap.set("n", "<leader>ms", "<cmd>ASToggle<CR>", { desc = "auto save" }),
		opts = {},
	},
}
