if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

umask 022
typeset -gx -U path PATH

path=( \
  /usr/local/bin(N-/) \
  $HOME/bin(N-/) \
  /usr/local/sbin(N-/) \
  "$path[@]" \
)

_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
    compinit -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}

: "help command configuration" && {
  autoload -Uz run-help
  autoload -Uz run-help-git
}

: "common configuration" && {
  _zpcompinit_custom
  zstyle ':completion:*:default' menu select=1
  autoload -Uz colors
  colors
  setopt correct
  setopt nobeep
  setopt no_tify
  setopt auto_pushd
  setopt auto_cd
  setopt interactive_comments
  setopt ignoreeof
  setopt no_flow_control

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

: "docker completion" && {
  zstyle ':completion:*:*:docker:*' option-stacking yes
  zstyle ':completion:*:*:docker-*:*' option-stacking yes
}

: "kubernetes" && {
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
}

declare -ax load_paths=(
  $ZPLUG_HOME/init.zsh\
  $ZDOTDIR/utils/alias.zsh\
  $ZDOTDIR/utils/env.zsh\
  $ZDOTDIR/utils/function.zsh\
  $ZDOTDIR/utils/keybind.zsh\
  $ZDOTDIR/utils/tmux.zsh
)

for load_path in ${load_paths[@]}; do
  load $load_path
  # log_pass "Loading complete $(basename $load_path)"
done

if is_debug; then
  if (which zprof > /dev/null); then
    zprof | less
  fi
fi

# log_pass "Loading complete .zshrc"
