umask 022

. $ZDOTDIR/utils/core.zsh # enable load function

load $ZDOTDIR/utils/alias.zsh

eval "$(direnv hook zsh)"

