#!/bin/bash

echo "[INFO] starting the installation..."

if [ "$(uname)" = "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install zsh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  apt install zsh
fi

echo "[INFO] finish installing, ok."
