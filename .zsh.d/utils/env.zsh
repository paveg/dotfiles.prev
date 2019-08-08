#!/bin/zsh

: "direnv" && {
  type direnv > /dev/null && eval "$(direnv hook zsh)"
}

# Install anyenv update command
if [[ ! -e $ANYENV_ROOT/plugins/anyenv-update ]]; then
  mkdir -p $ANYENV_ROOT/plugins
  git clone https://github.com/znz/anyenv-update.git $ANYENV_ROOT/plugins/anyenv-update
fi

# anyenv
if [ -d $ANYENV_ROOT ]; then
  export PATH=$ANYENV_ROOT/bin:$PATH
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH=$ANYENV_ROOT/envs/$D/shims:$PATH
    if [[ "$D" = "pyenv" ]]; then
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
      export PYENV_ROOT=$ANYENV_ROOT/envs/$D
    fi
  done
fi

# lazy load anyenv
# Due to this, when you install global command (ex. npm i --global) you need to
# eval "$(anyenv init -)" to validity
anyenv_init() {
  eval "$(command anyenv init - --no-rehash)"
}

_unset() {
  unset -f "$1" > /dev/null 2>&1
}

anyenv_unset() {
  _unset nodenv
  _unset rbenv
  _unset goenv
  _unset sbtenv
  _unset scalaenv
}

nodenv() {
  anyenv_unset
  anyenv_init
  nodenv "$@"
}

rbenv() {
  anyenv_unset
  anyenv_init
  rbenv "$@"
}

goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}

sbtenv() {
  anyenv_unset
  anyenv_init
  sbtenv "$@"
}

scalaenv() {
  anyenv_unset
  anyenv_init
  scalaenv "$@"
}

# setup go
export GOENV_DISABLE_GOPATH=1
export GOPATH="$HOME/src"
