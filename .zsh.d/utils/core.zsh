#!/bin/zsh -e

zcompare() {
  if [[ -s ${1} && (! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
    echo "recompile: ${1}"
    zcompile ${1}
  fi
}

load() {
  lib=${1:?"You have to specify a library file."}
  if [[ -f "$lib" ]]; then
    zcompare $lib
    . $lib
  fi
}

_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
    compinit -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}
