#!/usr/bin/env bash
set -e

echo "========== Installing Homebrew bundle =========="
brew bundle --file ~/.config/Brewfile

echo "========== Agoda Essentials ========="
brew tap devops/tap git@gitlab.agodadev.io:devops/homebrew.git && brew install devstack

echo "========== Installing Languages Framework =========="
asdf plugin add java || true
asdf install java zulu-17.58.21
asdf install java zulu-21.42.19
asdf set -u java zulu-21.42.19

asdf plugin add neovim || true
asdf install neovim nightly
asdf set -u neovim nightly

asdf plugin add nodejs || true
asdf install nodejs 16.16.0
asdf install nodejs 18.0.0
asdf install nodejs 24.6.0
asdf set -u nodejs 24.6.0

asdf plugin add poetry || true
asdf install poetry 2.1.2
asdf set -u poetry 2.1.2

asdf plugin add python || true
asdf install python 3.11.0
asdf install python 3.12.0
asdf install python 3.13.0
asdf set -u python 3.13.0

asdf plugin add yarn || true
asdf install yarn 1.22.22
asdf set -u yarn 1.22.22

asdf plugin add rust || true
asdf install rust latest
asdf set -u rust latest

echo "========== Install Scala Metals =========="
coursier install metals

echo "========== Make Fish default shell =========="
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
