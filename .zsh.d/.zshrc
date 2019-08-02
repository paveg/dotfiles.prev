umask 022

. $ZPLUG_HOME/init.zsh
. $ZDOTDIR/utils/core.zsh # enable load function

eval "$(direnv hook zsh)"

# check only once for zplug.
if [ "$ZPLUG_LOADFILE" -ne "$ZDOTDIR/utils/zplug.zsh" ];then
    ZPLUG_LOADFILE=$ZDOTDIR/utils/zplug.zsh; export ZPLUG_LOADFILE
    load $ZPLUG_LOADFILE
fi
