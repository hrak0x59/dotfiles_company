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

echo "完了しました。新しいターミナルで反映されます。"
