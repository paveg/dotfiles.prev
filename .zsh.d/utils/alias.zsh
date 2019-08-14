#!/bin/zsh -e

# alias utilities

# when exa exists
if (($+commands[exa])); then
  alias ls="exa -F"
  alias ll="exa -hlBFS"
  alias ld="exa -ld"
  alias la="exa -aF"
else
  alias ls="ls -F"
  alias ll="ls -hlS"
  alias ld="echo 'Not found ld command.'"
  alias la="ls -a"
fi

# when bat exists
if (($+commands[bat])); then
  alias cat="bat --style header,grid"
fi

# when nvim exists
if (($+commands[nvim])); then
  alias vi="nvim"
  alias vim="nvim"
fi

# when hub exists
if (($+commands[hub])); then
  alias g="hub"
  alias hb="hub browse"
fi

# when htop exists
if (($+commands[htop])); then
  alias top="htop"
fi

# when kubectl exists
if (($+commands[kubectl])); then
  alias k="kubectl"
  alias kc="kubectl config current-context"
  alias ku="kubectl config use-context"
  alias kp="kubectl get pod"
fi

# when onelogin-aws-login exists
if (($+commands[onelogin-aws-login])) && [ -n "$ONELOGIN_AWS_MAIL" ]; then
  local usermail="${ONELOGIN_AWS_MAIL}"
  alias ol="onelogin-aws-login -u ${usermail}"
fi

# when saml2aws exists
if (($+commands[saml2aws])); then
  alias s2l='saml2aws login --skip-prompt'
fi

# when remake exists
if (($+commands[remake])); then
  alias make="remake"
fi

# common aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias rm="${ZSH_VERSION:+nocorrect} rm -i"
alias cp="${ZSH_VERSION:+nocorrect} cp -i"
alias mv="${ZSH_VERSION:+nocorrect} mv -i"
alias mkdir="mkdir -p"

# Ruby alias
alias be="bundle exec"
alias bq="bundle install --quiet; echo 'exit $?'"

# zsh alias
alias zshenv='vi $ZDOTDIR/.zshenv'
alias zprofile='vi $ZDOTDIR/.zprofile'
alias zshrc='vi $ZDOTDIR/.zshrc'
alias zalias='vi $ZDOTDIR/utils/alias.zsh'
alias zcore='vi $ZDOTDIR/utils/core.zsh'
alias zfunction='vi $ZDOTDIR/utils/functions.zsh'
alias zenv='vi $ZDOTDIR/utils/env.zsh'
alias zkb='vi $ZDOTDIR/utils/key_bindings.zsh'
alias ezplug='vi $ZDOTDIR/utils/zplug.zsh'

# edit local secret file
alias zcred='vi $HOME/.local/secrets'
