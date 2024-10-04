return {
	"neovim/nvim-lspconfig",
	cmd = { "Mason", "Neoconf" },
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		"onsails/lspkind.nvim",
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			pyright = {},
			jsonls = {},
			marksman = {},
			clangd = {},
		}
		local on_attach = function(_, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
			nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>rn", "<cmd>Lspsaga rename ++project<cr>", "[R]e[n]ame")
			nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
			nmap("<leader>da", require("telescope.builtin").diagnostics, "[D]i[A]gnostics")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			-- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
			nmap("<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, "[F]ormat code")
		end
		require("lspkind").init({
			mode = "symbol_text",
			preset = "codicons",
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		})
		require("neoconf").setup()
		require("neodev").setup()
		require("lspsaga").setup()
		require("mason").setup()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						settings = servers[server_name],
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
