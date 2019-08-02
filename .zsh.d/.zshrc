umask 022

. $ZPLUG_HOME/init.zsh
. $ZDOTDIR/utils/core.zsh # enable load function

load $ZDOTDIR/utils/alias.zsh

eval "$(direnv hook zsh)"

# zplug integrations
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

