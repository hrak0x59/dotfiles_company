# ---------------------------------------------
# PATH設定（ユーザーbin優先）
# ---------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------
# oh-my-zsh 設定
# ---------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"           # テーマ（oh-my-zshデフォルト）
plugins=(git)                   # oh-my-zsh標準プラグイン
source $ZSH/oh-my-zsh.sh        # 必ず1回だけ

# ---------------------------------------------
# Starship prompt
# ---------------------------------------------
eval "$(starship init zsh)"      # 高速でカスタムプロンプト

# ---------------------------------------------
# 補助プラグイン
# ---------------------------------------------
# タイポ自動補正 & Enter前提案
ENABLE_CORRECTION="true"
setopt correct
setopt correctall

# コマンド履歴補助（未導入時はスキップ）
# サジェストの見た目（太字＋シアンで視認性アップ）
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6,bold'
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# コマンドシンタックスハイライト（未導入時はスキップ）
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# サジェスト優先：採用キーを明示（他プラグインよりあとで bind して優先）
(( $+widgets[autosuggest-accept] )) && {
  bindkey '^ '   autosuggest-accept   # Ctrl+Space でサジェストを一括採用
  bindkey '^[OM' autosuggest-accept   # テンキー Enter（競合しやすいのでサジェスト優先）
}

# fzf 設定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# CTRL-R: コマンド履歴検索
# CTRL-T: ファイル検索
# ALT-C: ディレクトリ移動

# thefuck 設定
eval $(thefuck --alias)
# 打ち間違えたら $ fuck で候補提示（必要に応じて使用）

# ---------------------------------------------
# エイリアス例
# ---------------------------------------------
alias ll="ls -la"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias lg="lazygit"

# ---------------------------------------------
# エディタ設定
# ---------------------------------------------
# SSH接続時はvim、ローカルはNeovim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ---------------------------------------------
# その他の便利設定
# ---------------------------------------------
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
DISABLE_UNTRACKED_FILES_DIRTY="true"  # Gitリポジトリ起動高速化
