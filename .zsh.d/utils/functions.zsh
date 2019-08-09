#!/bin/zsh -e

fbr() {
  local branches=$(git branch -vv | fzf --ansi --reverse --query "$LBUFFER")
  if [[ -n "$branches" ]]; then
    BUFFER="git checkout $(echo "$branches" | awk '{print $1}' | sed "s/.* //")"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fbr

fzf-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzf --ansi --reverse --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N fzf-select-history

ghq-fcd() {
  local selected_dir=$(ghq list -p | fzf --reverse -m --preview 'bat --color always --style header,grid --line-range :100 {}/README.*' --query "$LBUFFER")
  if [[ -n "$selected_dir" ]]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N ghq-fcd

fvim() {
  local file=$(fd "$BUFFER" ./ -t file | fzf --reverse -m --preview 'bat --color always --style header,grid --line-range :100 {}' --query "$LBUFFER")
  if [[ -n "$file" ]]; then
    BUFFER="nvim ${file}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fvim

fzf-fd() {
  if git rev-parse 2> /dev/null; then
    source_files=$(git ls-files)
  else
    source_files=$(fd "$BUFFER" ./ -t f)
  fi
  selected_files=$(echo $source_files | fzf --ansi --reverse --prompt "[find file]" --query "$LBUFFER")

  result=''
  for file in $selected_files; do
    result="${result}$(echo $file | tr '\n' ' ')"
  done

  BUFFER="${BUFFER}${result}"
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N fzf-fd

fzf-rg() {
  local lines=$(rg -i --hidden --follow --glob "!.git/*" $BUFFER ./ |
    fzf --reverse -m --query "$LBUFFER" --prompt "[fzf ripgrep]" |
    tr ":" ' ' |
    awk '{print $1}')
  if [[ -n "$lines" ]]; then
    BUFFER="$lines"
    zle redisplay
  fi
  CURSOR="$#BUFFER"
  zle clear-screen
}
zle -N fzf-rg

ref_enter() {
  if [[ -n "$BUFFER" ]]; then
    zle accept-line
    return 0
  fi
  echo
  ls -aGU
  if [[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]]; then
    echo
    echo -e "\e[0;33m--- git status ---\e[0m"
    git status -sb
  fi
  zle reset-prompt
  return 0
}
zle -N ref_enter

kex() {
  if [[ "$1" = "" ]]; then
    echo "Please, set your namespace"
    return
  fi
  pod=$(kubectl get pod --namespace $1 | fzf-tmux --ansi --reverse | awk '{print $1}')
  if [[ $? -eq 0 ]] && [[ "$pod" != "" ]]; then
    echo ">>> exec pod bash $pod"
    kubectl exec -it --namespace $1 $pod bash
  fi
}
zle -N kex

ksw() {
  local current=$(kubectl config current-context)
  echo "[info] select context... - current: $current"
  context=$(kubectl config get-contexts | fzf-tmux --ansi --reverse | awk '{print $2}')
  if [[ $? -eq 0 ]] && [[ "$context" != "" ]]; then
    kubectl config use-context $context
  fi
}
zle -N ksw

fzf-lsec2() {
  local ip=$(lsec2 -c | fzf --ansi --reverse --query "$LBUFFER" | awk '{print $2}')
  if [[ "$ip" != "" ]]; then
    BUFFER="ssh -t -t $ip"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-lsec2

