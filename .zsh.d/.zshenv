# load utilities
. $ZDOTDIR/utils/core.zsh # enable load function
load $DOTPATH/lib/utilities.sh

if is_debug; then
  log_info "profiling..."
  zmodload zsh/zprof && zprof
fi

: "locale & timezone" && {
  export TZ="Asia/Tokyo"
  export LANGUAGE="en_US.UTF-8"
  export LANG="${LANGUAGE}"
  export LC_ALL="${LANGUAGE}"
  export LC_CTYPE="${LANGUAGE}"
}

: "zplug environment" && {
  if [[ -z "${ZPLUG_HOME:-}" ]]; then
    export ZPLUG_HOME=$HOME/.zplug
  fi
  if [[ -z "${ZPLUG_LOADFILE:-}" ]]; then
    export ZPLUG_LOADFILE=$ZDOTDIR/utils/zplug.zsh
  fi
}

# XDG Base Directory Specification
# @see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
: "XDG base directory config" && {
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_CACHE_HOME=$HOME/.cache
}

: "Homebrew" && {
  if [[ -z "${HOMEBREW_CASK_OPTS:-}" ]]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  fi
}

: "Shell configuration" && {
  if (($+commands[nvim])); then
    export EDITOR=nvim
    export GIT_EDITOR="${EDITOR}"
  fi

  if is_osx; then
    export SHELL=/usr/local/bin/zsh
  elif is_linux; then
    export SHELL="$(brew --prefix)/bin/zsh"
  fi
}

: "fzf configuration" && {
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
  export FZF_DEFAULT_OPTS='--multi --ansi --reverse --border'
  : "emoji filter" && {
    export EMOJI_CLI_FILTER="fzf-tmux -d 30% --multi --ansi --reverse --border"
  }
}

: "Helm and Kubernetes" && {
  if [[ -z ${HELM_HOME:-} ]]; then
    export HELM_HOME=$HOME/.helm
  fi
}

: "aws saml login configuration" && {
  export AWS_PROFILE=saml
}

# setup local secret file
prepare_secrets

log_pass "Loading complete .zshenv"
