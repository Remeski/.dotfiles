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
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/folke/trouble.nvim" }
})

require("snacks").setup({
	picker = { enabled = true, layout = "dropdown" }
})
require("mason").setup()
require("oil").setup()
require("typst-preview").setup({
	open_cmd = "firefox %s"
})
require("blink.cmp").setup({
	fuzzy = { implementation = "rust" }
})
require("nvim-treesitter").setup()
require("trouble").setup()

vim.lsp.enable({ "lua_ls", "tinymist", "pyright", "rust_analyzer", "ts_ls" })

local picker = require("snacks.picker")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>sf", picker.files)
vim.keymap.set("n", "<leader>sg", picker.git_files)
vim.keymap.set("n", "<leader>ss", picker.lsp_symbols)
vim.keymap.set("n", "<leader>sG", picker.grep)
vim.keymap.set("n", "<leader>sh", picker.help)
vim.keymap.set("n", "<leader><leader>", picker.smart)
vim.keymap.set("n", "<leader>sn", function()
	picker.files({ cwd = vim.fn.stdpath("config") })
end)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(_)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gf", vim.lsp.buf.format)
	end,
})

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>")

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR><ESC>")

-- theme
vim.pack.add({
	-- { src = "https://github.com/shaunsingh/nord.nvim" }
	-- { src = "https://github.com/ellisonleao/gruvbox.nvim" };
	{ src = "https://github.com/RRethy/base16-nvim" }
})

-- vim.g.nord_disable_background = true
-- vim.cmd [[colorscheme gruvbox]]
--
local function source_matugen()
	-- Update this with the location of your output file
	local matugen_path = os.getenv("HOME") .. "/.config/nvim/colors.lua"  -- dofile doesn't expand $HOME or ~

	local file, err = io.open(matugen_path, "r")
	-- If the matugen file does not exist (yet or at all), we must initialize a color scheme ourselves
	if err ~= nil then
		-- Some placeholder theme, this will be overwritten once matugen kicks in
		vim.cmd('colorscheme base16-catppuccin-mocha')

		-- Optionally print something to the user
		vim.print("A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!")
	else
		dofile(matugen_path)
		io.close(file)
	end
end

-- Main entrypoint on matugen reloads
local function auxiliary_function()
  -- Load the matugen style file to get all the new colors
  source_matugen()
end

-- Register an autocmd to listen for matugen updates
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = auxiliary_function,
})

source_matugen()
