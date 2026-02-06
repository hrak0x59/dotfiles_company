#!/bin/bash
# dotfiles_company をホームにシンボリックリンクで展開する
set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "既存ファイルがあるためスキップ: $dst"
    return
  fi
  ln -sf "$src" "$dst"
  echo "リンク作成: $dst -> $src"
}

link "$DOTFILES_DIR/.zshrc"    "$HOME/.zshrc"
link "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
link "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# WezTerm
mkdir -p "$HOME/.config/wezterm"
link "$DOTFILES_DIR/config/wezterm/wezterm.lua"    "$HOME/.config/wezterm/wezterm.lua"
link "$DOTFILES_DIR/config/wezterm/cyberdream.lua" "$HOME/.config/wezterm/cyberdream.lua"

# Neovim
mkdir -p "$HOME/.config/nvim/lua/plugins"
link "$DOTFILES_DIR/config/nvim/init.lua"                    "$HOME/.config/nvim/init.lua"
link "$DOTFILES_DIR/config/nvim/lua/plugins/cyberdream.lua"  "$HOME/.config/nvim/lua/plugins/cyberdream.lua"

echo "完了しました。新しいターミナルで反映されます。"
