#!/bin/bash
set -ex

install_zsh() {
    if [ "$(uname)" = "Darwin" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew install zsh
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo apt-get update && sudo apt-get install -y zsh
    fi
}

apply_zsh() {
    sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
    chsh -s $(which zsh)
}

echo "[INFO] starting the installation..."

install_zsh
apply_zsh

echo "[INFO] finish installing, ok."
