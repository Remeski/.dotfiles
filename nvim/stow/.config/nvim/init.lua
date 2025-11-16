-- options 
vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.ignorecase = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- plugins
vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }
})


require("telescope").setup()
require("mason").setup()
require("oil").setup()
require("typst-preview").setup({
	open_cmd = "firefox %s"
})
require("blink.cmp").setup({
	fuzzy = { implementation = "rust" }
})
require("nvim-treesitter").setup()
-- require("vim-fugitive")

vim.lsp.enable({ "lua_ls", "tinymist", "pyright", "rust_analyzer", "ts_ls" })
vim.lsp.config('*', {})

local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>sf", telescope.find_files)
vim.keymap.set("n", "<leader>sg", telescope.git_files)
vim.keymap.set("n", "<leader>sG", telescope.live_grep)
vim.keymap.set("n", "<leader><leader>", telescope.buffers)
vim.keymap.set("n", "<leader>sn", function()
	telescope.find_files({ cwd = vim.fn.stdpath("config") })
end)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gf", vim.lsp.buf.format)
		vim.keymap.set("n", "<leader>E", vim.diagnostic.setqflist)
  end,
})

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR><ESC>")

-- theme
vim.pack.add({
	-- { src = "https://github.com/shaunsingh/nord.nvim" }
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" }
})

-- vim.g.nord_disable_background = true

vim.cmd[[colorscheme gruvbox]]
