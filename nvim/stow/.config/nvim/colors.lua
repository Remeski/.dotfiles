-- local config = {
--   base00 = "#1d100c",
--   base01 = "#100b0a",
--   base02 = "#ffb59f",
--   base03 = "#1e1715",
--   base04 = "#120a07",
--   base05 = "#f7ddd6",
--   base06 = "#150804",
--   base07 = "#1d100c",
--   base08 = "#1a0300",
--   base09 = "#e9c343",
--   base0A = "#ffb59f",
--   base0B = "#ffe082",
--   base0C = "#ffb59f",
--   base0D = "#180701",
--   base0E = "#000000",
--   base0F = "#f7ddd6",
-- }
-- require('base16-colorscheme').setup(config)

require('base16-colorscheme').setup({
  base00 = "#1d100c",
  base01 = "#170b08",
  base02 = "#261814",
  base03 = "#986e62",
  base04 = "#e2bfb5",
  base05 = "#f7ddd6",
  base06 = "#f7ddd6",
  base07 = "#79574e",
  base08 = "#ffb4ab",
  base09 = "#ff8e6c",
  base0A = "#ffb59f",
  base0B = "#ffb59f",
  base0C = "#e9c343",
  base0D = "#ffb59f",
  base0E = "#ffddd3",
  base0F = "#ffdad6",
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '#f56131',
  fg = '#1d100c',
})

-- vim.api.nvim_set_hl(0, 'Comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, 'String', {
	fg = "#e9c343"
})

-- vim.api.nvim_set_hl(0, '@comment', {
-- 	fg = config.base03,
-- 	italic = false
-- })

vim.api.nvim_set_hl(0, '@string', {
	fg = "#e9c343"
})
