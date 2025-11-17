-- local config = {
--   base00 = "#141318",
--   base01 = "#0c0c0e",
--   base02 = "#c8c2e6",
--   base03 = "#19181b",
--   base04 = "#0c0b0e",
--   base05 = "#e5e1e8",
--   base06 = "#0d0b0e",
--   base07 = "#141318",
--   base08 = "#1a0300",
--   base09 = "#ffade1",
--   base0A = "#c7bfff",
--   base0B = "#ffd8ed",
--   base0C = "#c7bfff",
--   base0D = "#0a0910",
--   base0E = "#ffffff",
--   base0F = "#e5e1e8",
-- }
-- require('base16-colorscheme').setup(config)

require('base16-colorscheme').setup({
  base00 = "#141318",
  base01 = "#0e0e12",
  base02 = "#1c1b20",
  base03 = "#787487",
  base04 = "#c9c4d2",
  base05 = "#e5e1e8",
  base06 = "#e5e1e8",
  base07 = "#5f5d6b",
  base08 = "#ffb4ab",
  base09 = "#a79ed7",
  base0A = "#c7bfff",
  base0B = "#c7bfff",
  base0C = "#c8c2e6",
  base0D = "#ffade1",
  base0E = "#e2dcff",
  base0F = "#ffdad6",
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#645ba5',
  fg = '#141318',
})

-- vim.api.nvim_set_hl(0, 'Comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, 'String', {
	fg = "#ffade1"
})

-- vim.api.nvim_set_hl(0, '@comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, '@string', {
	fg = "#ffade1"
})
