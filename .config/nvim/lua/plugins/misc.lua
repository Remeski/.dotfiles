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
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- require("mini.statusline").setup()

			-- miniS.setup()
			-- miniS.section_location = function()
			-- 	return "%2l:%-2v"
			-- end
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<F5>", "<Cmd>UndotreeToggle<CR>")
		end,
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
}
