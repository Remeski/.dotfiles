# Hyprland

## Requirements
- `hyprland`
- `hyprlock`
- `hypridle`
- `hyprshot`
- `bluetui`
- `pulsemixer`
- `swww` (older `hyprpaper`)
- `elephant` and `walker` (older `rofi`)
- `elephant-desktopapplications`, `elephant-clipboard`, `elephant-menus`
- `matugen`
- `kitty`

## Matugen

### GTK
For gtk theme switching create `gtk.css` files in `~/.config/gtk-X.0/` that has

```css
@import 'colors.css';
```

### Zen
- From `about:support` go to Profile Directory.
- Create `chrome`-folder.
- In `.config/matugen/config.toml` change zen related `input_path`s to the right Profile Directory/chrome/..

## Walker and elephant
Theme switcher looks for wallpaperps in `~/Pictures/Bgs`.
