require('base16-colorscheme').setup({
  base00 = "{{colors.background.default.hex}}",
  base01 = "{{colors.surface_container_lowest.default.hex}}",
  base02 = "{{colors.surface_container_low.default.hex}}",
  base03 = "{{colors.outline_variant.default.hex}}",
  base04 = "{{colors.on_surface_variant.default.hex}}",
  base05 = "{{colors.on_surface.default.hex}}",
  base06 = "{{colors.on_surface.default.hex}}",
  base07 = "{{colors.surface_variant.default.hex}}",
  base08 = "{{colors.error.default.hex}}",
  base09 = "{{colors.secondary_container.default.hex}}",
  base0A = "{{colors.primary.default.hex}}",
  base0B = "{{colors.primary.default.hex}}",
  base0C = "{{colors.secondary.default.hex}}",
  base0D = "{{colors.tertiary.default.hex}}",
  base0E = "{{colors.on_secondary_container.default.hex}}",
  base0F = "{{colors.on_error_container.default.hex}}",
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '{{colors.primary_container.default.hex}}',
  fg = '{{colors.background.default.hex}}',
})
