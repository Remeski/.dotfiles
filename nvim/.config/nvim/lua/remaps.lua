-- No highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- General
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil" })
-- vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-N>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-P>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-d>", "zz<C-d>")
vim.keymap.set("n", "<C-u>", "zz<C-u>")
vim.api.nvim_del_user_command("EditQuery")

-- Rest
vim.keymap.set("n", "<leader>rr", ":Rest run<CR>", { desc = "[R]est [R]un" })

-- Telescope
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sG", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch [G]it files" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>so", ":ObsidianSearch<CR>", { desc = "[S]earch [O]bsidian" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- vim.keymap.set("n", "<leader>s/", function()
-- 	builtin.live_grep({
-- 		grep_open_files = true,
-- 		prompt_title = "Live Grep in Open Files",
-- 	})
-- end, { desc = "[S]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- Random
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Zoom
vim.keymap.set("n", "<C-w>z", "<C-w>|<C-w>_", { desc = "Zoom in pane" })
vim.keymap.set("n", "<C-w>Z", "<C-w>=", { desc = "Zoom in pane" })

-- Undotree
vim.keymap.set("n", "<F5>", "<Cmd>UndotreeToggle<CR>")

-- LSP binds can be found in plugins/lsp.lua
