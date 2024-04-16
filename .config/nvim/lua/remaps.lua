vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "[W]orkspace [W](s)ave file" })
vim.keymap.set("n", "<leader>E", "<cmd>:E<CR>", { desc = "[E]xplorer" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-w>z", "<C-w>|<C-w>_", { desc = "Zoom in pane" })
vim.keymap.set("n", "<C-w>Z", "<C-w>=", { desc = "Zoom in pane" })

vim.keymap.set("n", "<C-N>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-P>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-N>", "<cmd>lnext<CR>")
vim.keymap.set("n", "<C-P>", "<cmd>lprev<CR>")
