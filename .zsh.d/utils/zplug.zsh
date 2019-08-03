#!/bin/zsh

# zplug integrations
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug 'chrissicool/zsh-256color', use:"zsh-256color.plugin.zsh"

# pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:"pure.zsh", from:github, as:theme &&
  export PURE_PROMPT_SYMBOL="%{$fg[green]%}pav@${HOST} %{$fg[red]%}❯❯❯"

# completion
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "glidenote/hub-zsh-completion"
zplug "Valodim/zsh-curl-completion"

# enhance change directory
zplug "b4b4r07/enhancd", use:"enhancd.sh"

# for git
zplug "mollifier/cd-gitroot"
zplug "paulirish/git-open", as:plugin
zplug "plugins/git", from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"

# fzf with gomi
zplug "junegunn/fzf-bin", as:command, from:"gh-r", rename-to:"fzf"
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "b4b4r07/zsh-gomi", as:command, use:"bin/gomi", on:"junegunn/fzf-bin"

# peco
zplug "peco/peco", as:command, from:"gh-r"
zplug "b4b4r07/dotfiles", as:command, use:"bin/peco-tmux"

zplug "lib/clipboard", from:"oh-my-zsh", if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# for docker
zplug "docker/cli", use:"contrib/completion/zsh/_docker", defer:2

# emoji
zplug "b4b4r07/emoji-cli", if:"which jq"

is_zplug_update() {
  if [ "$ZPLUG_UPDATE" = 1 ]; then
    return 0
  else
    return 1
  fi
}

if [ -z ${ZPLUG_UPDATE:-} ]; then
  export ZPLUG_UPDATE=0
fi

if is_zplug_update; then
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo
      zplug install
    fi
  fi
else
  zplug load
  log_info "zplug loaded"
fi
