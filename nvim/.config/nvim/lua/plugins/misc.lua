return {
	"tpope/vim-sleuth",
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		opts = {
			extra_groups = {
				"TelescopePromptNormal",
				"TelescopeMatching",
				"TelescopeSelection",
				"TelescopePromptTitle",
				"TelescopePromptPrefix",
				"TelescopePromptCounter",
				"TelescopePromptNormal",
				"TelescopePromptBorder",
				"TelescopeResultsTitle",
				"TelescopeResultsNormal",
				"TelescopeResultsBorder",
				"TelescopePreviewTitle",
				"TelescopePreviewNormal",
				"TelescopePreviewBorder",
			},
		},
	},
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
	-- {
	--	"echasnovski/mini.nvim",
	--	config = function()
	--		require("mini.ai").setup({ n_lines = 500 })
	--		-- Add/delete/replace surroundings (brackets, quotes, etc.)
	--		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	--		-- - sd'   - [S]urround [D]elete [']quotes
	--		-- - sr)'  - [S]urround [R]eplace [)] [']
	--		require("mini.surround").setup()
	--
	--		-- require("mini.statusline").setup()
	--
	--		-- miniS.setup()
	--		-- miniS.section_location = function()
	--		--	return "%2l:%-2v"
	--		-- end
	--	end,
	-- },
	{
		"mbbill/undotree",
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ "tpope/vim-fugitive" },
	{ "ThePrimeagen/vim-be-good" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			--
			vim.g.vimtex_compiler_latexmk = {
				options = {
					"-verbose",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
					"-shell-escape",
				},
			}
			vim.g.vimtex_view_method = "zathura"
			vim.cmd("syntax enable")
		end,
	},
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*", -- recommended, use latest release instead of latest commit
	-- 	lazy = true,
	-- 	ft = "markdown",
	-- 	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- 	-- event = {
	-- 	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	-- 	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	-- 	--   -- refer to `:h file-pattern` for more examples
	-- 	--   "BufReadPre path/to/my-vault/*.md",
	-- 	--   "BufNewFile path/to/my-vault/*.md",
	-- 	-- },
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	--
	-- 		-- see below for full list of optional dependencies 👇
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "secondbrane",
	-- 				path = "~/secondbrane/",
	-- 			},
	-- 		},
	--
	-- 		completion = {
	-- 			-- Set to false to disable completion.
	-- 			nvim_cmp = true,
	-- 			-- Trigger completion at 2 chars.
	-- 			min_chars = 2,
	-- 		}, -- see below for full list of options 👇
	-- 		mappings = {
	-- 			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
	-- 			["gf"] = {
	-- 				action = function()
	-- 					return require("obsidian").util.gf_passthrough()
	-- 				end,
	-- 				opts = { noremap = false, expr = true, buffer = true },
	-- 			},
	-- 			-- Toggle check-boxes.
	-- 			["<leader>ch"] = {
	-- 				action = function()
	-- 					return require("obsidian").util.toggle_checkbox()
	-- 				end,
	-- 				opts = { buffer = true },
	-- 			},
	-- 			-- Smart action depending on context, either follow link or toggle checkbox.
	-- 			["<cr>"] = {
	-- 				action = function()
	-- 					return require("obsidian").util.smart_action()
	-- 				end,
	-- 				opts = { buffer = true, expr = true },
	-- 			},
	-- 		},
	-- 	},
	-- },
	{ "rest-nvim/rest.nvim" },
}
