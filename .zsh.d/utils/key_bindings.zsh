#!/bin/zsh -e

# Required Keybind
bindkey "^A" beginning-of-line
bindkey "^K" kill-line

bindkey "^r" fzf-select-history
bindkey '^]' ghq-fcd
bindkey '^m' ref_enter
bindkey '^e' fbr
bindkey '^g' fzf-fd
bindkey '^l' fvim
bindkey '^p' fzf-lsec2
bindkey '^j' fzf-rg
