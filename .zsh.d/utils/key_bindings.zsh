#!/bin/zsh -e

# Required Keybind
bindkey "^a" beginning-of-line
bindkey '^e' end-of-line
bindkey "^k" kill-line
stty erase ^H
bindkey "^[[3~" delete-char

bindkey "^r" fzf-select-history
bindkey '^]' ghq-fcd
bindkey '^m' ref_enter
bindkey '^b' fbr
bindkey '^g' fzf-fd
bindkey '^j' fvim
bindkey '^p' fzf-lsec2
bindkey '^y' fzf-rg
