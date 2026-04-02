#! /usr/bin/env zsh
set -euxo pipefail

brew update
brew bundle install --file ~/macos/Brewfile
brew upgrade
brew cleanup

rustup self update
rustup update stable

if which cargo-install-update 2>&1 > /dev/null; then
  cargo install-update -a
fi

softwareupdate --list

chezmoi diff
