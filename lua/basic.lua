-------basic config
local o = vim.opt
local b = vim.b
local g = vim.g
--alow breakindent
o.breakindent = true
--show mode
o.showmode = false
--TAB " " x 4
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.shiftround = true
o.autoindent = true
--make line number default
o.smartindent = true
o.number = true
o.relativenumber = true
--see highlight search
o.hlsearch = true
--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
--highlight cursorline
o.cursorline = true
--use terminal true color
o.termguicolors = true
--Decrease update time
o.updatetime = 250
o.signcolumn = "yes"
o.autoread = true
o.title = true
o.swapfile = false
o.backup = false
o.linespace = 0
--set mouse is true
o.mouse = "a"
o.fileencoding = "utf-8"
o.exrc = true
o.wrap = true
--set clipboard
o.clipboard = "unnamedplus"
o.splitright = true
g.loaded_netrw = 1
g.encoding = "UTF-8"
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
