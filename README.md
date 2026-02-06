# dotfiles_company

社用環境用のドットファイル集です。

## 含まれる設定

- `.zshrc` - Zsh（oh-my-zsh, Starship, エイリアス等）
- `.zprofile` - Homebrew の PATH
- `.gitconfig` - Git（LFS, user name/email）

## セットアップ（このリポジトリをクローンした環境で）

```bash
cd dotfiles_company
chmod +x install.sh
./install.sh
```

既存の `.zshrc` 等が実ファイルで存在する場合は上書きせずスキップします。必要なら事前にバックアップしてください。

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

## 更新をプッシュする場合

```bash
cd /Users/liepin/Documents/dotfiles_company
git add .
git commit -m "設定を更新"
git push
```
