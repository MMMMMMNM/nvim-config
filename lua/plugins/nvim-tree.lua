return {
	{
		"kyazdani42/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "nvim tree" },
		},

		dependencies = {
			"b0o/nvim-tree-preview.lua",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				-- 是否显示 git 状态
				git = {
					enable = true,
				},
				-- 过滤文件
				filters = {
					dotfiles = true, -- 过滤 dotfile
					custom = { "node_modules" }, -- 其他过滤目录
				},
				view = {
					-- 文件浏览器展示位置，左侧：left, 右侧：right
					side = "left",
					-- 行号是否显示
					number = false,
					relativenumber = false,
					signcolumn = "yes", -- 显示图标
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					-- Important: When you supply an `on_attach` function, nvim-tree won't
					-- automatically set up the default keymaps. To set up the default keymaps,
					-- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
					api.config.mappings.default_on_attach(bufnr)

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					local preview = require("nvim-tree-preview")

					vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
					vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

					-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
					vim.keymap.set("n", "<Tab>", function()
						local ok, node = pcall(api.tree.get_node_under_cursor)
						if ok and node then
							if node.type == "directory" then
								api.node.open.edit()
							else
								preview.node(node, { toggle_focus = true })
							end
						end
					end, opts("Preview"))

					-- Option B: Simple tab behavior: Always preview
					-- vim.keymap.set('n', '<Tab>', preview.node_under_cursor, opts 'Preview')
				end,
			})
			require("nvim-tree-preview").setup({})
		end,
	},
}
