#!/bin/bash
set -e
export PLATFORM
source ./lib/utilities.sh

# install Homebrew
prepare() {
    if has "brew"; then
        log_info "already installed Homebrew"
        return
    fi
    if is_osx; then
       /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif is_linux; then
        sudo apt-get update && sudo apt-get install build-essential curl file git
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    fi
}

log_pass "Starting the installation..."
prepare

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi
if [ -d "$DOTPATH" ]; then
    log_fail "$DOTPATH: already exists"
    exit 1
fi
log_pass "dotfiles ok."
