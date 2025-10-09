# Install Homebrew
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Move from zsh to fish
```zsh
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
# restart terminal
fish_add_path "/opt/homebrew/bin/"
```

# Coding language version control
```fish
brew install asdf
```

# asdf syntax
```fish
asdf plugin add neovim (java,python,poetry,nodejs,yarn,etc.)
asdf install neovim latest
asdf set -u neovim {latest}
asdf list
```

# Terminal essential
```fish
brew install git
brew install yazi -- terminal file explorer
brew install fzf -- fuzzy finder
brew install ripgrep -- grep for nvim telescope
brew install jq -- yazi json previewer and json tools
brew install poppler -- yazi pdf viewer
brew install starship -- terminal colorizer
brew install zoxide -- better cd
brew install eza -- better ls
brew install tmux -- terminal window management
brew install tpm -- tmux plugin manager
```

# Screen customization
```fish
brew tap FelixKratz/formulae
brew install borders
brew install --cask aerospace
```

# Keyboard biding
```fish
brew install --cask karabiner-elemets
brew install goku

# to run 'goku or gokuw to keep polling for change'
```

# Development tools
```fish
brew install --cask postman
brew install --cask ghostty
```

# Productivity tools
```fish
brew install --cask raycast
brew install --cask shottr
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask lookaway
brew install --cask hiddenbar
brew install --cask spotify
brew install --cask appcleaner
brew install --cask raindropio
brew install --cask zen
```

# Browser Extension
- Vimium keymap
```
unmap J
unmap K
map J nextTab
map K previousTab
unmap <c-e>
unmap <c-y>
unmap d
unmap u
map <c-d> scrollPageDown
map <c-u> scrollPageUp
unmap x
map d removeTab
unmap gt
unmap gT
unmap b
unmap B
```

# Commands
`touch ..` --> Create file
`mkdir ..` --> Create folder
`rm ...` --> delete file
`rm -r ..` --> delete folder
`mv $SOURCE $DESTINATION` --> move/rename file
