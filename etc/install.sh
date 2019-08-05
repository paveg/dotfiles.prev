#!/bin/sh
set -eu

# functions
isExists() {
  command -v "$1" >/dev/null 2>&1
  return $?
}

isNotExist() {
  if isExists "$1"; then
    return 1
  else
    return 0
  fi
}

# TODO: tool check
# git

echo "start installing..."

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

if isNotExist brew; then
  # for macOS
  ruby -e "$(curl -fsSL https://githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
fi

echo "Install Applications..."
while read pkg
do
  if ! brew cask list | grep "$pkg" &>/dev/null; then
    echo "install $pkg..."
    brew cask install "$pkg"
  else
    echo "$pkg is already installed."
  fi
done < "$repoDir/pkg/brew_cask.txt"

echo "Install Packages..."
while read pkg
do
  if ! brew list | grep "$pkg" &>/dev/null; then
    echo "install $pkg"
    brew install "$pkg"
  else
    echo "$pkg is already installed"
  fi
done < "$repoDir/pkg/brew.txt"

echo "dotfiles OK."

