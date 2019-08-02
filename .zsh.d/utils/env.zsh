#!/bin/zsh

: "direnv" && {
  type direnv > /dev/null && eval "$(direnv hook zsh)"
}

# anyenv

if [ -d $ANYENV_ROOT ]; then
  export PATH=$ANYENV_ROOT/bin:$PATH
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH=$ANYENV_ROOT/envs/$D/shims:$PATH
  done
fi

# lazy load anyenv
# Due to this, when you install global command (ex. npm i --global) you need to
# eval "$(anyenv init -)" to validaty
function anyenv_init() {
  eval "$(anyenv init -)"
}

function anyenv_unset() {
  unset -f nodenv
  unset -f rbenv
  unset -f pyenv
  unset -f plenv
  unset -f tfenv
  unset -f goenv
  unset -f sbtenv
  unset -f scalaenv
}

function nodenv() {
  anyenv_unset
  anyenv_init
  nodenv "$@"
}

function rbenv() {
  anyenv_unset
  anyenv_init
  rbenv "$@"
}

function pyenv() {
  anyenv_unset
  anyenv_init
  pyenv "$@"
}

function plenv() {
  anyenv_unset
  anyenv_init
  plenv "$@"
}

function goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}

function tfenv() {
  anyenv_unset
  anyenv_init
  tfenv "$@"
}

function sbtenv() {
  anyenv_unset
  anyenv_init
  sbtenv "$@"
}

function scalaenv() {
  anyenv_unset
  anyenv_init
  scalaenv "$@"
}

