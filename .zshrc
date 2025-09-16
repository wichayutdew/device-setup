# ---- fetch PATH, MANPATH, etc., for Homebrew. ----
source <(/opt/homebrew/bin/brew shellenv)

# ---- Starship ----
eval "$(starship init zsh)"

bindkey -v # vim mode
setopt IGNORE_EOF # this is to prevent ctrl+d to close terminal

# ---- Added by Toolbox App ----
export PATH="$PATH:/Users/wphongphanpa/Library/Application\ Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:/Users/wphongphanpa/Library/Application Support/Coursier/bin"

# ---- Added by zoxide ----
source <(zoxide init --cmd cd zsh)

# ---- Direct usage to asdf location ----
. /opt/homebrew/opt/asdf/libexec/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- fzf ----
source <(fzf --zsh)

# ---- Aerospace ----
ff () {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

# ---- Carapace -----
autoload -Uz compinit
compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# --- Aliases ----
alias soy-health-check="watch -n 2 curl -m 1 -sS 127.0.0.1:2501/version"
alias local-search="""
  cd repositories/activities-local-vault
  docker-compose -f local-vault.yml up -d
  docker-compose -f local-dragonflydb.yml up -d
  cd
"""
alias lg="lazygit"
alias vi="nvim"
alias leet="nvim leetcode.nvim"
alias tm="tmux"
