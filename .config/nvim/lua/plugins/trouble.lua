return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local trouble = require("trouble")
		vim.keymap.set("n", "<leader>tt", trouble.toggle, { desc = "[T]rouble [T]oggle" })
		vim.keymap.set("n", "<leader>tn", trouble.next, { desc = "[T]rouble [N]ext" })
		vim.keymap.set("n", "<leader>tp", trouble.previous, { desc = "[T]rouble [P]revious" })
	end,
}
