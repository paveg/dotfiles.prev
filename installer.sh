#!/bin/bash
set -euo pipefail
export PLATFORM
source ./lib/utilities.sh

trap catch ERR

function catch {
    log_fail "Failed to installation"
}

install_brew() {
    if has "brew"; then
        log_info "Homebrew is already installed."
        return
    elif is_linux; then
        log_info "work in progress for linux"
        return
    fi
    log_info "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    log_pass "Installation complete Homebrew!"
}

install_zsh_by_brew() {
    if ! brew list | grep zsh &> /dev/null; then
        log_info "Installing zsh..."
        brew install zsh zsh-completions
        log_pass "Installation complete zsh!"
        sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells'
        echo -ne '\n' | sudo chsh -s $(brew --prefix)/bin/zsh
    else
        log_info "zsh is already installed."
    fi
}

install_brew_packages() {
    local fomuras=( ghq tree direnv anyenv wget htop tmux fzf tig jq )
    log_info "Installing brew packages..."
    for fomura in ${fomuras[@]}; do
        if ! brew list | grep $fomura &> /dev/null; then
            log_info "Installing ${fomura}..."
            brew install ${fomura}
        else
            log_warn "${fomura} is already installed."
        fi
    done
    log_pass "Installation complete brew packages."
}

log_info "dotfiles start..."
install_brew
install_zsh_by_brew
install_brew_packages
log_pass "dotfiles ok."
