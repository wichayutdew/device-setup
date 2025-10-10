#!/usr/bin/env bash
set -e

if ! command -v brew &>/dev/null; then
  echo "========== Installing Homebrew... =========="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "========== Homebrew already installed. =========="
fi

echo "========== Installing Homebrew bundle =========="
brew bundle --file ~/Brewfile

echo "========== Installing Languages Framework =========="
asdf plugin add gradle || true
asdf install gradle 9.0.0

asdf plugin add java || true
asdf install java zulu-17.58.25
asdf install java zulu-21.36.19
asdf set -u java zulu-21.36.19

asdf plugin add neovim || true
asdf install neovim nightly

asdf plugin add nodejs || true
asdf install nodejs 16.16.0
asdf install nodejs 18.0.0
asdf install nodejs 24.6.0
asdf set -u nodejs 24.6.0

asdf plugin add poetry || true
asdf install poetry 2.1.2

asdf plugin add python || true
asdf install python 3.11.0
asdf install python 3.12.0
asdf install python 3.13.0
asdf set -u python 3.13.0

echo "========== Install Scala Metals =========="
cs install metals

asdf plugin add yarn || true
asdf install yarn 1.22.22

echo "========== Make Fish default shell =========="
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
