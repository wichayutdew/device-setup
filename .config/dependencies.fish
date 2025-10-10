echo "Add Homebrew to Fish"
fish_add_path /opt/homebrew/bin/

echo "Install asdf and languages"
brew install asdf
asdf plugin add neovim; or true
asdf plugin add java; or true
asdf plugin add python; or true
asdf plugin add poetry; or true
asdf plugin add nodejs; or true
asdf plugin add yarn; or true
asdf install neovim nighthly
asdf global neovim (asdf latest nightly)
asdf list

echo "Installing CLI Essentials"
brew install git yazi fzf ripgrep jq poppler starship zoxide eza tmux tpm

echo "Installing Screen Customisation"
brew tap FelixKratz/formulae
brew install borders
brew install --cask aerospace

echo "Installing Keyboard remap tools"
brew install --cask karabiner-elements
brew install goku

echo "Installing Development tools"
brew install --cask postman
brew install --cask ghostty

echo "Installing Productivity tools"
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

echo "All installation complete!"
