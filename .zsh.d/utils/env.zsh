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
function anyenv_init() {
  eval "$(anyenv init - --no-rehash)"
}

function anyenv_unset() {
  unset -f nodenv
  unset -f rbenv
  #  unset -f tfenv
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

function goenv() {
  anyenv_unset
  anyenv_init
  goenv "$@"
}

# function tfenv() {
#   anyenv_unset
#   anyenv_init
#   tfenv "$@"
# }

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

# setup go
export GOENV_DISABLE_GOPATH=1
export GOPATH="$HOME/src"
