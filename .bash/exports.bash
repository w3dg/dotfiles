#Colors
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxegedabagacad'

export PROMPT_DIRTRIM=3

# export EDITOR="nano" 
export EDITOR="micro" 
export LANG="en_US.UTF-8"
export HISTSIZE=10000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear" # Dont record some commands
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# FZF
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'
export FZF_DEFAULT_OPTS='--layout=reverse --keep-right'

# Bat themes
export BAT_THEME="Visual Studio Dark+"
