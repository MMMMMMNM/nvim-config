return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = "VeryLazy",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "cpp", "lua", "html", "python", "cmake", "markdown" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
