Name = "theme"
NamePretty = "Theme"
Cache = true
HideFromProviderlist = false
Description = "lua test menu"
SearchName = true
Action = "matugen --contrast 0.0 %VALUE%"

local function capitalize(str)
	return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
end

function GetEntries()
	local entries = {}
	local wallpaper_dir = "/home/rmz/Pictures/Bgs/"

	local modes = { "dark", "light" }
	local types = { "scheme-content", "scheme-expressive", "scheme-fidelity", "scheme-fruit-salad", "scheme-monochrome",
		"scheme-neutral", "scheme-rainbow", "scheme-tonal-spot", "scheme-vibrant" }

	local handle = io.popen("find '" ..
		wallpaper_dir ..
		"' -maxdepth 1 -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' 2>/dev/null")
	if handle then
		for line in handle:lines() do
			local filename = line:match("([^/]+)$")
			if filename then
				for _, type in ipairs(types) do
					for _, mode in ipairs(modes) do
						table.insert(entries, {
							Subtext = capitalize(string.sub(type, string.len("scheme-") + 1)) .. " | " .. capitalize(mode),
							Text = filename,
							Keywords = { filename, type, mode },
							Value = "-t " .. type .. " -m " .. mode .. " image " .. line,
							Preview = line,
						})
					end
				end
			end
		end
		handle:close()
	end

	return entries
end
