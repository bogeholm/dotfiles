#! /usr/bin/env zsh

append_path_if_exists() {
    if [ -d "${1}" ]; then
        export PATH="${1}:${PATH}"
    fi
}

append_path_if_exists "/usr/local/texlive/2021/bin/universal-darwin"

# LaTeX - requires sudo
# https://tex.stackexchange.com/questions/55437/how-do-i-update-my-tex-distribution
tlmgr update --self
tlmgr update --all
