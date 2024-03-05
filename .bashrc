# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Yarn PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Load Up Some Cool ColorScripts!! https://gitlab.com/dwt1/shell-color-scripts
# ~/code/repos/Color-Scripts/color-scripts/crunchbang-mini
# Echo the current date in "Weekday, year-month-day" format
echo "Today is $(date +"%a, %F %T")"

eval "$(dircolors -b ~/.dircolors)"

source ~/.bash/bindings.bash       # Bindings
source ~/.bash/shopts.bash         # Shopts
source ~/.bash/exports.bash        # Exports
source ~/.bash/functions.bash      # Custom functions
source ~/.bash/aliases.bash        # Aliases
source ~/.bash/git_aliases.bash    # Git aliases

source ~/.bash/npm-completion.bash # npm completion
source ~/.bash/pandoc-completion.bash # pandoc completion

alias fortune="~/code/fortune-node/index.js"
# npm i -g cowsay ( on a linux machine just do it)
# fortune | cowsay -f tux

if [ $RANDOM -ge 15000 ]; then
	asciiCats nyan | lolcat
else
	fortune | cowsay -f tux | lolcat 	
fi

# zoxide - Website: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"

# fzf - Website: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵" "😊" "🤯" "👽" "🦄" "🐽" "🐍" "🦖" "🦕" "🐊" "🐢" "🐧" "💎" "🪄" "🍀" "🌈" "⚡" "🔥" "🌊")
EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

export PS1='\[\033]0;Bash \007\]'
# full user info

# export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]bluestone\[\e[01;00m\] \[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \n\[\e[01;32m\]$EMOJI λ\[\e[01;00m\] '


# prompt symbol - ❯

prompt_command() {
  # sync history between terminals
  history -a; # append to history file the current session
  history -c; # clear history for current session
  history -r; # read in the latest everywhere
 }

export PROMPT_COMMAND=prompt_command

# colors from https://robotmoon.com/bash-prompt-generator/
# export PS1="\[\e[38;5;39m\]\u\[\e[38;5;45m\]@\[\e[38;5;51m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ " # Sea
# export PS1="\[\e[38;5;33m\]\u\[\e[38;5;69m\]@\[\e[38;5;105m\]\h \[\e[38;5;141m\]\w \[\033[0m\]$ " # Twilight
# export PS1="\[\e[38;5;34m\]\u\[\e[38;5;40m\]@\[\e[38;5;46m\]\h \[\e[38;5;154m\]\w \[\033[0m\]$ " # Emerald Green
# export PS1='\n\[\e[01;36m\]\w\[\e[01;32m\] `echo $(__git_ps1 "git:(%s)")` \n❯\[\e[01;00m\] '

export PS1='\n\[\e[38;5;158m\]\w\[\e[38;5;245m\] `echo $(__git_ps1 "git:(%s)")` \n\[\e[38;5;33m\]❯\[\e[01;00m\] '

export PS2='continue>'

[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash
