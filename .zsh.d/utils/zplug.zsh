#!/bin/zsh

# zplug integrations
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:"pure.zsh", from:github, as:theme && export PURE_PROMPT_SYMBOL="❯❯❯"

# completion
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "glidenote/hub-zsh-completion"
zplug "Valodim/zsh-curl-completion"

# enhance change directory
zplug "b4b4r07/enhancd", use:"enhancd.sh"
zplug "mollifier/cd-gitroot"
zplug "paulirish/git-open", as:plugin

# fzf with gomi
zplug "junegunn/fzf-bin", as:command, from:"gh-r", rename-to:"fzf"
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "b4b4r07/zsh-gomi", as:command, use:"bin/gomi", on:"junegunn/fzf-bin"

# peco
zplug "peco/peco", as:command, from:"gh-r"
zplug "b4b4r07/dotfiles", as:command, use:"bin/peco-tmux"

zplug "lib/clipboard", from:"oh-my-zsh", if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# emoji
zplug "b4b4r07/emoji-cli", if:"which jq"

need_update() {
  if [ ! $ZPLUG_HOME/check.zplug -nt $ZDOTDIR/utils/zplug.zsh ] || [ ! $ZPLUG_HOME/check.zplug -nt $ZDOTDIR/.zshrc ]; then
    return 0
  else
    return 1
  fi
}

if need_update; then
  touch $ZPLUG_HOME/check.zplug
  if [[ -f $ZPLUG_HOME/init.zsh ]]; then
    if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
        echo
        zplug install
      fi
    fi
  fi
fi

zplug load