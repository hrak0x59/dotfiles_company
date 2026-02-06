# dotfiles_company

社用環境用のドットファイル集です。

## 含まれる設定

| パス | 内容 |
|------|------|
| `.zshrc` | Zsh（oh-my-zsh, Starship, エイリアス等） |
| `.zprofile` | Homebrew の PATH |
| `.gitconfig` | Git（LFS, user name/email） |
| `config/wezterm/` | WezTerm（cyberdream テーマ・キーバインド） |
| `config/nvim/` | Neovim（Lazy.nvim, cyberdream, キーマップ） |

---

## WezTerm ショートカット

※ SUPER = ⌘ (Command), ALT = Option

| キー | 動作 |
|------|------|
| **⌘+Shift+i** | ペインを横分割（下に新ペイン） |
| **⌘+Shift+l** | ペインを縦分割（右に新ペイン） |
| **⌘+j** | ペイン移動：左 |
| **⌘+l** | ペイン移動：右 |
| **⌘+i** | ペイン移動：上 |
| **⌘+k** | ペイン移動：下 |
| **Option+w** | 現在のペインを閉じる（確認あり） |
| **Option+z** | ペインズーム（最大化 / 戻す） |
| **Option+j** | ペイン幅：左に調整 |
| **Option+k** | ペイン高さ：下に調整 |
| **Option+l** | ペイン幅：右に調整 |
| **Option+i** | ペイン高さ：上に調整 |

---

## Neovim ショートカット（キーマップ）

移動・挿入は **WezTerm の ⌘+jkli（左・右・上・下）と揃えています**。

| キー | モード | 動作 |
|------|--------|------|
| **j** | ノーマル / ビジュアル / オペレータ | 左へ移動 |
| **k** | 同上 | 下へ移動 |
| **l** | 同上 | 右へ移動 |
| **i** | 同上 | 上へ移動 |
| **h** | ノーマル | 挿入モード（`i` の代わり） |
| **H** | ノーマル | 行頭で挿入（`I` の代わり） |
| **Space** | - | リーダーキー（`<Leader>`） |

※ 通常の `i`（挿入）は `h` に割り当て済みです。`j/k/l/i` は矢印キーと同じ動きになります。

---

## セットアップ（このリポジトリをクローンした環境で）

```bash
cd dotfiles_company
chmod +x install.sh
./install.sh
```

既存の `.zshrc` 等が実ファイルで存在する場合は上書きせずスキップします。必要なら事前にバックアップしてください。

- **WezTerm**: `~/.config/wezterm/` に `wezterm.lua` と `cyberdream.lua` をリンクします。
- **Neovim**: 初回起動時に Lazy.nvim が cyberdream.nvim を自動インストールします。

---

## Git にアップする手順（初回）

1. GitHub / GitLab 等で **空のリポジトリ**（例: `dotfiles_company`）を作成する。

2. このディレクトリでリモートを追加してプッシュする:

   ```bash
   cd /Users/liepin/Documents/dotfiles_company
   git remote add origin https://github.com/あなたのユーザー名/dotfiles_company.git
   # または SSH: git remote add origin git@github.com:あなたのユーザー名/dotfiles_company.git
   git branch -M main
   git push -u origin main
   ```

3. 既にリモートがある場合は:

   ```bash
   git push -u origin main
   ```

---

## 更新をプッシュする場合

```bash
cd /Users/liepin/Documents/dotfiles_company
git add .
git commit -m "設定を更新"
git push
```
