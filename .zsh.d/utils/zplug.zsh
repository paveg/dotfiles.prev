#!/bin/zsh

# zplug integrations
zplug zplug/zplug, hook-build:'zplug --self-manage'

# pure theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

if [[ -f $ZPLUG_HOME/init.zsh ]]; then
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo
      zplug install
    fi
  fi
  zplug load --verbose
fi
