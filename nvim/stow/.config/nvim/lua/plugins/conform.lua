return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 2500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "goimports", "gofmt" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
		},
		formatters = {
			black = {
				append_args = { "--line-length", "200" },
			},
		},
	},
}
