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

# ---- YAZI OPEN IN NVIM ----
set -gx EDITOR 'nvim'

# ---- RESHIM AFTER INSTALL, TO PREVENT MISSING $HOME PATH ---
# Auto-reshim after cargo install
function cargo
    command cargo $argv
    and if test "$argv[1]" = "install"
        asdf reshim rust
    end
end

# ---- ALIASES ----
alias vi 'nvim'
alias ls 'eza --color=always --long --git --icons=always --no-time --no-user'
alias lg 'lazygit'
alias ld 'lazydocker'
alias leet 'nvim leetcode.nvim'
alias tm 'tmux'
alias cdi 'zi'
alias cd 'z'
alias yz 'yazi'
alias cfg 'nvim ~/.config/fish/config.fish'
alias cl 'clear'
alias so 'source ~/.config/fish/config.fish'
alias ce 'zed .'
alias id 'idea .'

# ---- SHORT_HAND_ALIASES ----
alias v 'nvim'
alias l 'eza --color=always --long --git --icons=always --no-time --no-user'
alias g 'lazygit'
alias d 'lazydocker'
alias t 'tmux'
alias ci 'zi'
alias c 'z'
alias y 'yazi'

# ---- Agoda Specific ----
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
alias soy-health-check 'watch -n 2 curl -m 1 -sS 127.0.0.1:2501/version'
