# fet PATH, MANPATH, etc., for Homebrew.
source <(/opt/homebrew/bin/brew shellenv)

# Added by Toolbox App
export PATH="$PATH:/Users/wphongphanpa/Library/Application\ Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:/Users/wphongphanpa/Library/Application Support/Coursier/bin"

# Added by zoxide
source <(zoxide init --cmd cd zsh)

# Direct usage to asdf location
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- fzf ----
source <(fzf --zsh)

# ---- Aerospace ----
ff () {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

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
