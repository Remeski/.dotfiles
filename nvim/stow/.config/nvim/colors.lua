-- local config = {
--   base00 = "#0f141a",
--   base01 = "#0b0c0e",
--   base02 = "#dfbbde",
--   base03 = "#17191c",
--   base04 = "#0a0c0f",
--   base05 = "#dfe3eb",
--   base06 = "#0a0c10",
--   base07 = "#0f141a",
--   base08 = "#1a0300",
--   base09 = "#a5caf5",
--   base0A = "#c3cd72",
--   base0B = "#d0e4ff",
--   base0C = "#c3cd72",
--   base0D = "#171a00",
--   base0E = "#dfea8b",
--   base0F = "#dfe3eb",
-- }
-- require('base16-colorscheme').setup(config)

require('base16-colorscheme').setup({
  base00 = "#0f141a",
  base01 = "#0a0f14",
  base02 = "#171c22",
  base03 = "#6b798d",
  base04 = "#bec7d5",
  base05 = "#dfe3eb",
  base06 = "#dfe3eb",
  base07 = "#556070",
  base08 = "#ffb4ab",
  base09 = "#cf98cd",
  base0A = "#c3cd72",
  base0B = "#c3cd72",
  base0C = "#dfbbde",
  base0D = "#a5caf5",
  base0E = "#fcd7fb",
  base0F = "#ffdad6",
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#434b00',
  fg = '#0f141a',
})

-- vim.api.nvim_set_hl(0, 'Comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, 'String', {
	fg = "#a5caf5"
})

-- vim.api.nvim_set_hl(0, '@comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, '@string', {
	fg = "#a5caf5"
})
