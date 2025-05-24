# Newer and better .dotfiles

Requires `stow`. `install.sh` will check if it's installed.

Usage: `./install.sh [TARGET]`

## Configuring targets

- Create a folder with the name of the target.
- Inside this folder you can create `stow/`, `install.sh` ad `packages.txt`.

### `stow/`

Everything inside here will be stowed in your `HOME` folder.

### `install.sh`

Installer script will run everything inside this script.

### `packages.txt`

A new-line separeted list of packages that the installer script will try to install.
