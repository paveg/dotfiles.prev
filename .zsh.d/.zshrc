umask 022

: "common configuration" && {
  autoload -U compinit && compinit -d $ZPLUG_HOME/zcompdump
  autoload -Uz colors
  colors
  setopt correct
  setopt nobeep
  setopt no_tify
  setopt auto_pushd
  setopt auto_cd
  setopt interactive_comments
}

: "configuration for history" && {
  HISTFILE=$HOME/.zhistory
  HISTSIZE=10000
  SAVEHIST=10000
  setopt hist_ignore_dups
  setopt hist_ignore_all_dups
  setopt share_history
  setopt hist_no_store
  setopt hist_reduce_blanks
  setopt hist_verify
}

. $ZPLUG_HOME/init.zsh
. $ZDOTDIR/utils/core.zsh # enable load function
load $ZPLUG_LOADFILE
load $ZDOTDIR/utils/env.zsh
load $ZDOTDIR/utils/function.zsh
