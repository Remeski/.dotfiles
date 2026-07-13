-- OPTIONS
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

-- PLUGINS
vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon",          version = "harpoon2" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("snacks").setup({
	picker = { enabled = true, layout = "dropdown" }
})
require("gitsigns").setup({})
require("mason").setup()
require("mason-lspconfig").setup()
require("oil").setup()
require("typst-preview").setup({
	open_cmd = "firefox %s"
})
require("blink.cmp").setup({
	fuzzy = { implementation = "rust", prebuilt_binaries = { ignore_version_mismatch = true } }
})
require("nvim-treesitter").setup()
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true
	}
})
require("trouble").setup()
require("harpoon").setup()

local pylaunch = require("pylaunch")
pylaunch.setup()

-- COLORS
require("matugen")
vim.pack.add({
	{ src = "https://github.com/shaunsingh/nord.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	-- { src = "https://github.com/RRethy/base16-nvim" }
})

-- vim.cmd("colorscheme default")

vim.lsp.enable({ "lua_ls", "tinymist", "pylsp", "rust_analyzer", "clangd" })
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(_)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
	end,
})


-- BINDS
local picker = require("snacks.picker")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>sf", picker.files)
vim.keymap.set("n", "<leader>sg", picker.git_files)
vim.keymap.set("n", "<leader>ss", picker.lsp_symbols)
vim.keymap.set("n", "<leader>sG", picker.grep)
vim.keymap.set("n", "<leader>sh", picker.help)
vim.keymap.set("n", "<leader><leader>", picker.buffers)
vim.keymap.set("n", "<leader>sn", function()
	picker.files({ cwd = vim.fn.stdpath("config") })
end)

vim.keymap.set("n", "<leader>tt", "<CMD>Trouble diagnostics toggle<CR>")
-- vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>")

vim.keymap.set("n", "<leader>ph", function() pylaunch.run_current_file({ hidden = true }) end)
vim.keymap.set("n", "<leader>pp", "<CMD>PyLaunchStart<CR>")
vim.keymap.set("n", "<leader>ps", "<CMD>PyLaunchStop<CR>")

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR><ESC>")

local harpoon = require("harpoon");
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-N>", "<CMD>cnext<CR>")
vim.keymap.set("n", "<C-P>", "<CMD>cprev<CR>")
