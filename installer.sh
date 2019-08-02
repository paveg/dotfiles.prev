#!/bin/bash
set -euo pipefail
export PLATFORM
. lib/utilities.sh
. lib/package_list.sh

trap catch ERR

function catch {
    log_fail "Failed to installation"
}

reconfigure_brew() {
  log_info "Reconfigure Homebrew..."
  brew cleanup
  brew update
  brew tap --repair
  if is_linux; then
    git -C "/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core" remote set-url origin https://github.com/Homebrew/linuxbrew-core.git
  fi
  log_pass "configuration complete!"
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
        brew install zsh zsh-completions zplug
        log_pass "Installation complete zsh!"
        echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
        echo -ne '\n' | sudo chsh -s $(brew --prefix)/bin/zsh
        if [ -z "${ZPLUG_HOME:-}" ]; then
          ZPLUG_HOME=$HOME/.zplug; export ZPLUG_HOME
        fi
    else
        log_info "zsh is already installed."
    fi
}

install_brew_packages() {
    log_info "Installing brew packages..."
    for fomura in ${FOMURAS[@]}; do
        if ! brew list | grep $fomura &> /dev/null; then
            log_info "Installing ${fomura}..."
            brew install ${fomura}
        else
            log_warn "${fomura} is already installed."
        fi
    done
    log_pass "Installation complete brew packages."
}

install_brew_cask_packages() {
  log_info "Installing brew cask packages..."
  if is_osx; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    for package in ${CASK_PACKAGES[@]}; do
      if ! brew cask list | grep $package &> /dev/null; then
        log_info "Installing ${package}..."
        brew cask install ${package}
      else
        log_warn "${package} is already installed."
      fi
    done
  else
    log_info "current os is not MacOS."
  fi
  log_pass "Installation complete brew cask."
}

log_info "dotfiles start..."
install_brew
reconfigure_brew
install_zsh_by_brew
install_brew_packages
install_brew_cask_packages

# zplug clone
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi

log_pass "dotfiles ok."
