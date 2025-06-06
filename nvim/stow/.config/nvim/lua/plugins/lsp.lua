return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"b0o/schemastore.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>rr", vim.lsp.buf.references, "[R]efe[R]ences")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = event.buf })

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		-- local MY_FQBN = "arduino:avr:nano"
		local servers = {
			clangd = {
				-- filetypes = {
				-- 	"arduino",
				-- },
			},
			gopls = {},
			pyright = {},
			ansiblels = {
				cmd = { "ansible-language-server", "--stdio" },
				settings = {
					ansible = {
						python = {
							interpreterPath = "python",
						},
						ansible = {
							path = "ansible",
						},
						executionEnvironment = {
							enabled = false,
						},
						validation = {
							enabled = true,
							lint = {
								enabled = true,
								path = "ansible-lint",
							},
						},
					},
				},
				filetypes = { "yml", "yaml" },
				root_dir = require("lspconfig.util").root_pattern("ansible.cfg", ".ansible-lint"),
				single_file_support = true,
			},
			jsonls = {
				capabilities = {
					textDocument = {
						completion = {
							completionItem = {
								snippetSupport = true,
							},
						},
					},
				},
				settings = {
					json = {
						schemas = require("schemastore").json.schemas({
							select = {
								".eslintrc",
								"package.json",
								"tsconfig.json",
							},
						}),
						validate = { enable = true },
					},
				},
			},
			rust_analyzer = {},
			["typescript-language-server"] = {
				root_dir = require("lspconfig.util").root_pattern(".git"),
			},
			["arduino-language-server"] = {
				capabilities = { semanticTokensProvider = nil },
				cmd = {
					"/home/eeli/.local/share/nvim/mason/bin/arduino-language-server",
					"-cli-config",
					"/home/eeli/.arduino15/arduino-cli.yaml",
					"-cli",
					"/usr/local/bin/arduino-cli",
					"-clangd",
					"/home/eeli/.local/share/nvim/mason/bin/clangd",
					"-fqbn",
					"arduino:avr:leonardo",
				},
			},
			lua_ls = {
				-- cmd = {...},
				-- filetypes { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
					},
				},
			},
		}
		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format lua code
			"clangd",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						cmd = server.cmd,
						-- single_file_support = server.single_file_support,
						root_dir = server.root_dir,
						settings = server.settings,
						filetypes = server.filetypes,
						capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
					})
				end,
			},
		})
	end,
}
