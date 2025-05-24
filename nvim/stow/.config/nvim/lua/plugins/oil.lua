return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["<C-r>"] = "actions.refresh",
				["`"] = "actions.cd",
				["~"] = {
					"actions.cd",
					opts = { scope = "tab" },
					desc = ":tcd to the current oil directory",
					mode = "n",
				},
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
