#!/usr/bin/env bash


detect_pkg_manager () {
if [ -f /etc/debian_version ]; then
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt update && sudo apt install -y"
elif [ -f /etc/redhat-release ]; then
    if command -v dnf >/dev/null 2>&1; then
        PKG_MANAGER="dnf"
        INSTALL_CMD="sudo dnf install -y"
    else
        PKG_MANAGER="yum"
        INSTALL_CMD="sudo yum install -y"
    fi
elif [ -f /etc/arch-release ] || grep -qi 'arch' /etc/os-release 2>/dev/null; then
    PKG_MANAGER="pacman"
    INSTALL_CMD="sudo pacman -S --noconfirm"
elif [ "$(uname)" = "Darwin" ]; then
    PKG_MANAGER="brew"
    INSTALL_CMD="brew install"
else
    echo "[-] Unsupported OS."
    exit 1
fi
echo "[+] Detected $PKG_MANAGER as package manager"
}

check_stow() {
which stow &>/dev/null

if [ $? == "0" ]; then
    echo "[+] STOW seems to be installed"
else
    read -p "[+] STOW isn't installed. Do you want to install it (Y/n) " ack
    ack_lowered=$(echo $ack | awk '{ print tolower($0) }')
    if [ $ack_lowered == "y" ]; then
        detect_pkg_manager
        $INSTALL_CMD stow
    fi
fi
}

TARGET=$1

if [ -z $TARGET ]; then
    echo "Usage: $0 [target]"
    check_stow
    exit 1
fi

echo "[+] Installing $TARGET"

if [ -f "${TARGET}/install.sh" ]; then
    echo "[+] Running ${TARGET}/install.sh"
    ./${TARGET}/install.sh
fi
if [ -f "${TARGET}/packages.txt" ]; then
    detect_pkg_manager
    PACKAGES=$(tr '\n' ' ' < ${TARGET}/packages.txt)
    echo "[+] Installing packages: $PACKAGES"
    echo "  [+] Running: $INSTALL_CMD "$PACKAGES""
    $INSTALL_CMD "$PACKAGES"
fi
if [ -d "${TARGET}/stow" ]; then
    check_stow
    echo "[+] Running stow on $TARGET"
    stow -d $TARGET -t $HOME stow
fi

echo "[+] Finished installing $TARGET"
