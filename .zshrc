# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Toolbox App
export PATH="$PATH:/Users/wphongphanpa/Library/Application\ Support/JetBrains/Toolbox/scripts"

# Added by zoxide
eval "$(zoxide init --cmd cd zsh)"

# Direct usage to asdf location
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Runstarship
eval "$(starship init zsh)"

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)
