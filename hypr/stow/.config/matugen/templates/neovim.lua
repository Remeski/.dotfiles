-- local config = {
--   base00 = "{{colors.surface.default.hex}}",
--   base01 = "{{colors.surface_variant.default.hex | set_lightness: 5.0}}",
--   base02 = "{{colors.secondary_fixed_dim.default.hex}}",
--   base03 = "{{colors.outline.default.hex | set_lightness: 10.0}}",
--   base04 = "{{colors.on_surface_variant.default.hex | set_lightness: 5.0}}",
--   base05 = "{{colors.on_surface.default.hex}}",
--   base06 = "{{colors.on_surface.default.hex | set_lightness: 5.0}}",
--   base07 = "{{colors.surface.default.hex}}",
--   base08 = "{{colors.error.default.hex | set_lightness: 5.0}}",
--   base09 = "{{colors.tertiary.default.hex}}",
--   base0A = "{{colors.primary.default.hex}}",
--   base0B = "{{colors.tertiary_fixed.default.hex}}",
--   base0C = "{{colors.primary_fixed_dim.default.hex}}",
--   base0D = "{{colors.primary_container.default.hex | set_lightness: 5.0}}",
--   base0E = "{{colors.on_primary_container.default.hex}}",
--   base0F = "{{colors.inverse_surface.default.hex}}",
-- }
-- require('base16-colorscheme').setup(config)

-- require('base16-colorscheme').setup({
--   base00 = "{{colors.surface.default.hex}}",
--   base01 = "{{colors.surface_container_lowest.default.hex}}",
--   base02 = "{{colors.surface_container_low.default.hex}}",
--   base03 = "{{colors.outline_variant.default.hex | auto_lightness: 20.0}}",
--   base04 = "{{colors.on_surface_variant.default.hex}}",
--   base05 = "{{colors.secondary.default.hex}}",
--   base06 = "{{colors.on_surface.default.hex}}",
--   base07 = "{{colors.surface_variant.default.hex | auto_lightness: 10.0}}",
--   base08 = "{{colors.error.default.hex}}",
--   base09 = "{{colors.tertiary.default.hex}}",
--   base0A = "{{colors.secondary_fixed.default.hex}}",
--   base0B = "{{colors.secondary.default.hex}}",
--   base0C = "{{colors.tertiary.default.hex}}",
--   base0D = "{{colors.primary.default.hex | lighten: 5.0}}",
--   base0E = "{{colors.on_secondary_container.default.hex}}",
--   base0F = "{{colors.on_error_container.default.hex}}",
-- })

local colors = {
	bg = "{{colors.surface.default.hex}}",
	fg = "{{colors.on_surface.default.hex}}",
	accent = "{{colors.primary.default.hex}}",
	accent_variant = "{{colors.secondary.default.hex}}",
	error = "{{colors.error.default.hex}}",
	success = "{{colors.tertiary.default.hex}}",
	warning = "{{colors.error.default.hex}}",
}

return colors
