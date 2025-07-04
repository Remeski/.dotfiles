return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = function()
			local colors = {
				darkgray = "#16161d",
				gray = "#cccccc",
				innerbg = nil,
				outerbg = "#16161D",
				normal = "#7e9cd8",
				insert = "#98bb6c",
				visual = "#ffa066",
				replace = "#e46876",
				command = "#e6c384",
			}
			return {
				inactive = {
					a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				visual = {
					a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				replace = {
					a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				normal = {
					a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				insert = {
					a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				command = {
					a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
			}
		end

		require("lualine").setup({
			options = {
				-- theme = "gruvbox_dark",
				theme = "nord",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
			},
		})
		vim.opt.showmode = false
	end,
}
