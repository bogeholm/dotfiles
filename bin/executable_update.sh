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
pipx list --short | cut -d ' ' -f 1 > ~/macos/pipx-packages.txt

# Update App Store apps
mas upgrade
# List OS upgrades to install manually
softwareupdate --list

chezmoi diff
