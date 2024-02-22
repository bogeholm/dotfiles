#! /usr/bin/env zsh
set -euxo pipefail

brew update
brew bundle install --file ~/macos/Brewfile
brew upgrade
brew cleanup

# brew upgrade --cask --greedy mambaforge
conda update -n base -c conda-forge conda mamba --yes

npm update -g

pipx upgrade-all

rustup self update
rustup update stable

if which cargo-install-update 2>&1 > /dev/null; then
  cargo install-update -a
fi

tldr --update

code --list-extensions > ~/macos/code-extensions.txt
pipx list --short > ~/macos/pipx-packages.txt

softwareupdate --list

chezmoi diff
