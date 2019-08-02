#!/bin/bash
set -u

declare -ax FOMURAS=(
  docker ghq tree direnv anyenv wget htop tmux fzf tig jq yq nkf hub gibo bat exa fd xsv ripgrep neovim awk
)
declare -ax CASK_PACKAGES=(
  alfred clipy keycastr shiftit spotify google-japanese-ime docker karabiner-elements dropbox google-chrome
  kindle iterm2 slack jetbrains-toolbox 1password
)
