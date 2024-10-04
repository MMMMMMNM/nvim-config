return {
	{
		"nosduco/remote-sshfs.nvim",
		lazy = true,
		cmd = { "RemoteSSHFSConnect" },
		config = function()
			require("remote-sshfs").setup({})
		end,
	},
}
