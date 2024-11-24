# Set PATH, MANPATH, etc., for Homebrew.
source <(/opt/homebrew/bin/brew shellenv)

# Added by Toolbox App
export PATH="$PATH:/Users/wphongphanpa/Library/Application\ Support/JetBrains/Toolbox/scripts"

# Added by zoxide
source <(zoxide init --cmd cd zsh)

# Direct usage to asdf location
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Runstarship
source <(starship init zsh)

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- TheFuck -----
source <(thefuck --alias)
source <(thefuck --alias fk)

# ---- fzf ----
source <(fzf --zsh)

