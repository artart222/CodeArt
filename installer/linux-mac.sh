#!/usr/bin/env bash
# Install CodeArt system dependencies for Linux and macOS.

set -euo pipefail

PACKAGE_MANAGER=""

if [[ "$(uname)" == "Linux" ]]; then
  if command -v pacman >/dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"
  elif command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt-get"
  elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
  elif command -v zypper >/dev/null 2>&1; then
    PACKAGE_MANAGER="zypper"
  elif command -v emerge >/dev/null 2>&1; then
    PACKAGE_MANAGER="emerge"
  else
    echo "No supported package manager found (pacman, apt-get, dnf, zypper, emerge)."
    exit 1
  fi
elif [[ "$(uname)" == "Darwin" ]]; then
  PACKAGE_MANAGER="brew"
  if ! command -v brew >/dev/null 2>&1; then
    echo "brew is not installed"
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Apple Silicon Homebrew is not on PATH until shell config is updated.
    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    echo "brew is installed. Checking next dependency.."
  fi
else
  echo "Unsupported OS: $(uname)"
  exit 1
fi

# Ensure user-local bin is available (used for apt fdfind -> fd symlink).
mkdir -p "${HOME}/.local/bin"
case ":${PATH}:" in
  *":${HOME}/.local/bin:"*) ;;
  *) export PATH="${HOME}/.local/bin:${PATH}" ;;
esac

# Args: pm binary pacman apt dnf zypper emerge brew
# Pass "-" for a package slot to skip that package manager (e.g. npm on brew).
pack_manager_install() {
  local pm="$1"
  local binary="$2"
  local pacman_pkg="$3"
  local apt_pkg="$4"
  local dnf_pkg="$5"
  local zypper_pkg="$6"
  local emerge_pkg="$7"
  local brew_pkg="$8"
  local pkg=""

  if command -v "$binary" >/dev/null 2>&1; then
    echo "$binary is installed. Checking next dependency.."
    return 0
  fi

  case "$pm" in
    pacman) pkg="$pacman_pkg" ;;
    apt-get) pkg="$apt_pkg" ;;
    dnf) pkg="$dnf_pkg" ;;
    zypper) pkg="$zypper_pkg" ;;
    emerge) pkg="$emerge_pkg" ;;
    brew) pkg="$brew_pkg" ;;
    *)
      echo "Unknown package manager: $pm"
      return 1
      ;;
  esac

  if [[ -z "$pkg" || "$pkg" == "-" ]]; then
    echo "No package mapped for $binary on $pm; skipping."
    return 0
  fi

  echo "$binary is not installed."
  echo "Installing $binary ($pkg)"

  case "$pm" in
    pacman)
      sudo pacman -Sy "$pkg" --noconfirm
      ;;
    apt-get)
      sudo apt update
      sudo apt install "$pkg" -y
      ;;
    dnf)
      sudo dnf install "$pkg" -y
      ;;
    zypper)
      sudo zypper ref
      sudo zypper install -n "$pkg"
      ;;
    emerge)
      sudo emerge "$pkg"
      ;;
    brew)
      brew install "$pkg"
      ;;
  esac
}

# Debian/Ubuntu ship sharkdp/fd as fdfind; create an fd shim when needed.
ensure_fd_shim() {
  if command -v fd >/dev/null 2>&1; then
    return 0
  fi
  if command -v fdfind >/dev/null 2>&1; then
    ln -sf "$(command -v fdfind)" "${HOME}/.local/bin/fd"
    echo "Created fd shim at ${HOME}/.local/bin/fd -> $(command -v fdfind)"
  fi
}

install_font() {
  echo "Downloading JetBrainsMono Nerd Font"
  echo "Please wait"
  mkdir -p "${HOME}/Downloads"
  local zip="${HOME}/Downloads/JetBrainsMono.zip"
  local extract_dir="${HOME}/Downloads/JetBrainsMono"
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip" \
    --output-document="$zip"
  rm -rf "$extract_dir"
  unzip -o "$zip" -d "$extract_dir"

  local font_file
  font_file="$(find "$extract_dir" -type f \( -name '*NerdFontMono*.ttf' -o -name '*Nerd Font Mono*.ttf' -o -name '*.ttf' \) | head -n 1)"
  if [[ -z "$font_file" ]]; then
    echo "Could not find a JetBrainsMono font file in the archive."
    return 1
  fi

  if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
    mkdir -p "${HOME}/Library/Fonts"
    cp "$font_file" "${HOME}/Library/Fonts/"
  else
    mkdir -p "${HOME}/.local/share/fonts"
    cp "$font_file" "${HOME}/.local/share/fonts/"
    fc-cache -f -v
  fi
  echo "Font installed"
}

echo "Installing dependencies"

# Neovim: skip stock install on Debian (README asks users to use testing/backports).
if [[ "$(uname)" == "Darwin" ]]; then
  pack_manager_install "$PACKAGE_MANAGER" "nvim" "neovim" "neovim" "neovim" "neovim" "app-editors/neovim" "neovim"
elif [[ "$(uname)" == "Linux" ]]; then
  if grep -q '^ID=debian$' /etc/os-release 2>/dev/null; then
    echo "Debian detected: install Neovim yourself (see README), then continue."
  elif [[ "$PACKAGE_MANAGER" == "apt-get" ]]; then
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt update
    pack_manager_install "$PACKAGE_MANAGER" "nvim" "-" "neovim" "-" "-" "-" "-"
  else
    pack_manager_install "$PACKAGE_MANAGER" "nvim" "neovim" "neovim" "neovim" "neovim" "app-editors/neovim" "neovim"
  fi
fi

pack_manager_install "$PACKAGE_MANAGER" "curl" "curl" "curl" "curl" "curl" "net-misc/curl" "curl"
pack_manager_install "$PACKAGE_MANAGER" "git" "git" "git" "git" "git" "dev-vcs/git" "git"
pack_manager_install "$PACKAGE_MANAGER" "unzip" "unzip" "unzip" "unzip" "unzip" "app-arch/unzip" "unzip"
pack_manager_install "$PACKAGE_MANAGER" "node" "nodejs" "nodejs" "nodejs" "nodejs" "net-libs/nodejs" "node"
# npm ships with node on Homebrew; Gentoo nodejs typically provides npm via USE flags.
pack_manager_install "$PACKAGE_MANAGER" "npm" "npm" "npm" "npm" "npm" "-" "-"
# xclip is an X11 clipboard tool; skip on macOS (Neovim uses pbcopy/pbpaste).
if [[ "$(uname)" == "Linux" ]]; then
  pack_manager_install "$PACKAGE_MANAGER" "xclip" "xclip" "xclip" "xclip" "xclip" "x11-misc/xclip" "-"
fi
pack_manager_install "$PACKAGE_MANAGER" "gcc" "gcc" "gcc" "gcc" "gcc" "sys-devel/gcc" "gcc"
pack_manager_install "$PACKAGE_MANAGER" "make" "make" "make" "make" "make" "sys-devel/make" "make"
# ripgrep package installs the `rg` binary.
pack_manager_install "$PACKAGE_MANAGER" "rg" "ripgrep" "ripgrep" "ripgrep" "ripgrep" "sys-apps/ripgrep" "ripgrep"
# Fedora/Debian package is fd-find; Arch/openSUSE/Homebrew/Gentoo use fd.
pack_manager_install "$PACKAGE_MANAGER" "fd" "fd" "fd-find" "fd-find" "fd" "sys-apps/fd" "fd"
ensure_fd_shim
pack_manager_install "$PACKAGE_MANAGER" "wget" "wget" "wget" "wget" "wget" "net-misc/wget" "wget"
# CLI package names: brew/pacman/apt/dnf/emerge use tree-sitter-cli; openSUSE ships tree-sitter.
pack_manager_install "$PACKAGE_MANAGER" "tree-sitter" "tree-sitter-cli" "tree-sitter-cli" "tree-sitter-cli" "tree-sitter" "dev-util/tree-sitter-cli" "tree-sitter-cli"

install_font

if command -v pip3 >/dev/null 2>&1; then
  pip3 install --user pynvim
elif command -v pip >/dev/null 2>&1; then
  pip install --user pynvim
else
  echo "pip3 not found; skip pynvim (install python3-pip if you need it)."
fi

if command -v npm >/dev/null 2>&1; then
  npm install -g neovim
else
  echo "npm not found; skip neovim npm package."
fi

echo "Dependencies installed"
echo
echo "Installation finished"
