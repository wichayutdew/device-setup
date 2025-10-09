# ---- FISH ----
set fish_greeting ''

# ---- STARSHIP ----
starship init fish | source

# ---- JETBRAINS TOOL BOX ----
set -x PATH $PATH /Users/wphongphanpa/Library/Application\ Support/JetBrains/Toolbox/scripts
set -x PATH $PATH /Users/wphongphanpa/Library/Application\ Support/Coursier/bin

# ---- Zoxide Initialization ----
zoxide init fish | source

# ---- ASDF JAVA HOME -----
source /opt/homebrew/opt/asdf/libexec/asdf.fish
source ~/.asdf/plugins/java/set-java-home.fish

# ---- FZF ----
fzf --fish | source

# ---- AEROSPACE ----
function ff
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
end

# ---- EXPORT ----
set -gx EDITOR 'nvim'

# ---- ALIASES ----
alias ls 'eza --color=always --long --git --icons=always --no-time --no-user'
alias soy-health-check 'watch -n 2 curl -m 1 -sS 127.0.0.1:2501/version'
alias local-search 'cd repositories/activities-local-vault; docker-compose -f local-vault.yml up -d; docker-compose -f local-dragonflydb.yml up -d; cd'
alias lg 'lazygit'
alias vi 'nvim'
alias leet 'nvim leetcode.nvim'
alias tm 'tmux'
alias cdi 'zi'
alias cd 'z'
alias yz 'yazi'
alias cfg 'vi ~/.config/fish/config.fish'
alias so 'source ~/.config/fish/config.fish'

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
