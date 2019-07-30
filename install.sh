#!/bin/bash
set -e
export PLATFORM
source ./lib/utilities.sh

fomuras=("zsh" "cmake" "anyenv" "wget" "htop" "tmux" "fzf" "tig" "jq")

# install Homebrew
prepare() {
    if has "brew"; then
        log_info "already installed Homebrew"
        return
    fi
    if is_osx; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif is_linux; then
         log_info "break linux now"
         exit 0
#        sudo apt-get update && sudo apt-get install -y --no-install-recommends build-essential curl file git gcc language-pack-ja
#        sudo update-locale LANG=ja_JP.UTF-8
#        sudo useradd -m ryota && echo 'ryota ALL=NOPASSWD: ALL' | sudo tee -a /etc/sudoers
#        sudo -u ryota -H sh -c 'echo -ne '\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"'
#        echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
#        source ~/.profile
    fi
    brew update
}

log_pass "Starting the installation..."
prepare
brew install ${fomuras[@]}

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi
if [ -d "$DOTPATH" ]; then
    log_fail "$DOTPATH: already exists"
    exit 1
fi
log_pass "dotfiles ok."
