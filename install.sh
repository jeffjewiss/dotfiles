#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

packages=(
  brewfile
  ghostty
  git
  gnupg
  jiratui
  karabiner
  lazygit
  lsd
  nvim
  opencode
  starship
  tmux
  zed
  zsh
)

if ! command -v stow &>/dev/null; then
  echo "Error: stow is not installed. Install it with: brew install stow"
  exit 1
fi

cd "$DOTFILES_DIR"

echo "==> Stowing dotfiles..."
for pkg in "${packages[@]}"; do
  if [[ -d "$pkg" ]]; then
    echo "  stow $pkg"
    stow -R "$pkg" 2>/dev/null || stow "$pkg"
  else
    echo "  skipping $pkg (not found)"
  fi
done

echo ""
echo "==> Dotfiles stowed successfully."
echo ""

if [[ -f "$DOTFILES_DIR/brewfile/.config/brewfile/Brewfile" ]]; then
  echo "==> Homebrew packages available."
  echo "  To install: brew bundle --file=$DOTFILES_DIR/brewfile/.config/brewfile/Brewfile"
  echo ""
fi

echo "==> Done!"
