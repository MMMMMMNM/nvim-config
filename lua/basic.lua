-------basic config
local o = vim.opt
local b = vim.b
local g = vim.g
o.showmode = false
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.shiftround = true
o.autoindent = true
o.smartindent = true
o.number = true
o.relativenumber = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.autoread = true
o.title = true
o.swapfile = false
o.backup = false
o.updatetime = 50
o.mouse = "a"
o.exrc = true
o.wrap = true
o.clipboard = "unnamedplus"
o.splitright = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
--------<leader>
g.mapleader = " "
--------colorscheme
--vim.cmd[[colorscheme catppuccin-mocha]]
vim.api.nvim_create_autocmd({ "ExitPre" }, {
	callback = function()
		vim.opt.guicursor = "a:ver30-blinkon0"
	end,
})
