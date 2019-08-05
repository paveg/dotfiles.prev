#!/bin/sh
set -eu

# utility functions ------------------------------

is_exists() {
  command -v "$1" >/dev/null 2>&1
  return $?
}

is_not_exists() {
  if is_exists "$1"; then
    return 1
  else
    return 0
  fi
}

ink() {
  if [[ "$#" -eq 0 ]] || [[ "$#" -gt 2 ]]; then
    echo "Usage: ink <color> <text>"
    echo "Colors:"
    echo "  black, white, red, green, yellow, blue, purple, cyan, gray"
    return 1
  fi

  local open="\033["
  local close="${open}0m"
  local black="0;30m"
  local red="1;31m"
  local green="1;32m"
  local yellow="1;33m"
  local blue="1;34m"
  local purple="1;35m"
  local cyan="1;36m"
  local gray="0;37m"
  local white="$close"

  local text="$1"
  local color="$close"

  if [[ "$#" -eq 2 ]]; then
    text="$2"
    case "$1" in (black | red | green | yellow | blue | purple | cyan | gray | white)
      eval color="\$$1"
      ;;
    esac
  fi

  printf "${open}${color}${text}${close}"
}

logging() {
  if [[ "$#" -eq 0 ]] || [[ "$#" -gt 2 ]]; then
    echo "Usage: ink <fmt> <msg>"
    echo "Formatting Options:"
    echo "  TITLE, ERROR, WARN, INFO, SUCCESS"
    return 1
  fi

  local color=
  local text="$2"

  case "$1" in
  TITLE)
    color=yellow
    ;;
  ERROR | WARN)
    color=red
    ;;
  INFO)
    color=blue
    ;;
  SUCCESS)
    color=green
    ;;
  *)
    text="$1"
    ;;
  esac

  timestamp() {
    ink gray "["
    ink purple "$(date +%H:%M:%S)"
    ink gray "] "
  }

  timestamp
  ink "$color" "$text"
  echo
}

log_pass() {
  logging SUCCESS "$1"
}

log_fail() {
  logging ERROR "$1" 1>&2
}

log_warn() {
  logging WARN "$1"
}

log_info() {
  logging INFO "$1"
}

log_echo() {
  logging TITLE "$1"
}


# -----------------------------------------

# TODO: tool check
# git

log_info "start installing..."

readonly githubUser="paveg"
readonly githubRepo="dotfiles"
readonly githubDir="$HOME/src/github.com"
readonly repoDir="$githubDir/$githubUser/$githubRepo"
readonly repoUrl="https://github.com/$githubUser/$githubRepo.git"

# configuration brew cask
if [[ -z "${HOMEBREW_CASK_OPTS:-}" ]]; then
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

if [[ ! -d "$githubDir" ]]; then
  mkdir -p "$githubDir"
fi

if [[ ! -d $repoDir ]]; then
  git clone $repoUrl $repoDir
fi

if is_not_exists brew; then
  # for macOS
  ruby -e "$(curl -fsSL https://githubusercontent.com/Homebrew/install/master/install)"
  log_pass "Homebrew installation is completed."
else
  log_warn "Homebrew is already installed."
fi

log_info "Install Applications..."
while read pkg
do
  if ! brew cask list | grep $pkg &>/dev/null; then
    log_info "Installing $pkg..."
    brew cask install $pkg
  else
    log_warn "$pkg is already installed."
  fi
done < "$repoDir/pkg/brew_cask.txt"
log_pass "Applications installation is completed."

log_info "Install Packages..."
while read pkg
do
  if ! brew list | grep $pkg &>/dev/null; then
    log_info "Installing $pkg..."
    brew install $pkg
  else
    log_warn "$pkg is already installed"
  fi
done < "$repoDir/pkg/brew.txt"
log_pass "Packages installation is completed."

# TODO: check and fix .zshenv and .zshrc paths.
# symbolic link src/github.com/paveg/dotfiles to ~/dotfiles
# ln -sf "$repoDir/" "$HOME/dotfiles"
# ln -sf "$repoDir/.zshenv" "$HOME/.zshenv"
log_pass "dotfiles OK."

log_info "change shells..."
export SHELL="$(brew --prefix)/bin/zsh"
if [[ -z $(cat /etc/shells | grep $SHELL) ]]; then
  echo $SHELL | sudo tee -a /etc/shells
fi
echo -ne '\n' | sudo chsh -s $SHELL
exec $SHELL -l
