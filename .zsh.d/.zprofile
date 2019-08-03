. $ZDOTDIR/utils/alias.zsh

if (($+commands[nvim])); then
  export EDITOR=nvim
  export GIT_EDITOR="${EDITOR}"
fi
