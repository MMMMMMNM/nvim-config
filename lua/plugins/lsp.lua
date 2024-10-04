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
		"rachartier/tiny-inline-diagnostic.nvim",
	},
	config = function()
		vim.diagnostic.config({ virtual_text = false })
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
		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "    ",
				up_arrow = "    ",
				vertical = " │",
				vertical_end = " └",
			},
			hi = {
				error = "DiagnosticError",
				warn = "DiagnosticWarn",
				info = "DiagnosticInfo",
				hint = "DiagnosticHint",
				arrow = "NonText",
				background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
				mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
			},
			blend = {
				factor = 0.27,
			},
			options = {
				-- Show the source of the diagnostic.
				show_source = false,

				-- Throttle the update of the diagnostic when moving cursor, in milliseconds.
				-- You can increase it if you have performance issues.
				-- Or set it to 0 to have better visuals.
				throttle = 20,

				-- The minimum length of the message, otherwise it will be on a new line.
				softwrap = 15,

				-- If multiple diagnostics are under the cursor, display all of them.
				multiple_diag_under_cursor = false,

				-- Enable diagnostic message on all lines.
				multilines = false,

				overflow = {
					-- Manage the overflow of the message.
					--    - wrap: when the message is too long, it is then displayed on multiple lines.
					--    - none: the message will not be truncated.
					--    - oneline: message will be displayed entirely on one line.
					mode = "wrap",
				},

				-- Format the diagnostic message.
				-- Example:
				-- format = function(diagnostic)
				--     return diagnostic.message .. " [" .. diagnostic.source .. "]"
				-- end,
				format = nil,

				--- Enable it if you want to always have message with `after` characters length.
				break_line = {
					enabled = false,
					after = 30,
				},

				virt_texts = {
					priority = 2048,
				},

				-- Filter by severity.
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.INFO,
					vim.diagnostic.severity.HINT,
				},

				-- Overwrite events to attach to a buffer. You should not change it, but if the plugin
				-- does not works in your configuration, you may try to tweak it.
				overwrite_events = nil,
			},
		})
		require("lspkind").init({
			-- DEPRECATED (use mode instead): enables text annotations
			--
			-- default: true
			-- with_text = true,

			-- defines how annotations are shown
			-- default: symbol
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = "symbol_text",

			-- default symbol map
			-- can be either 'default' (requires nerd-fonts font) or
			-- 'codicons' for codicon preset (requires vscode-codicons font)
			--
			-- default: 'default'
			preset = "codicons",

			-- override preset symbols
			--
			-- default: {}
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
