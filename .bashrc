# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Yarn PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Load Up Some Cool ColorScripts!! https://gitlab.com/dwt1/shell-color-scripts
# ~/code/repos/Color-Scripts/color-scripts/crunchbang-mini
# Echo the current date in "Weekday, year-month-day" format
echo "Today is $(date +"%a, %F %T")"
echo ""

eval "$(dircolors -b ~/.dircolors)"

source ~/.bash/bindings.bash       # Bindings
source ~/.bash/shopts.bash         # Shopts
source ~/.bash/exports.bash        # Exports
source ~/.bash/functions.bash      # Custom functions
source ~/.bash/aliases.bash        # Aliases
source ~/.bash/git_aliases.bash    # Git aliases

alias fortune="~/code/fortune-node/index.js"
# npm i -g cowsay ( on a linux machine just do it)
fortune | cowsay

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵" "😊" "🤯" "👽" "🦄" "🐽" "🐍" "🦖" "🦕" "🐊" "🐢" "🐧" "💎" "🪄" "🍀" "🌈" "⚡" "🔥" "🌊")
EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

export PS1='\[\033]0;Bash \007\]'
# full user info
 # export PS1='\[\e[01;32m\]\u\[\e[00;33m\]@\[\e[1;34m\]\h\[\e[01;00m\]:\[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "(%s)")`\n\[\e[01;35m\]❯\[\e[01;00m\] '

# export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]cal\[\e[01;00m\] \[\e[01;35m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \n\[\e[01;32m\]$EMOJI ❯\[\e[01;00m\] '
# export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]bluestone\[\e[01;00m\] \[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \n\[\e[01;32m\]$EMOJI λ\[\e[01;00m\] '

export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]bluestone\[\e[01;00m\] \[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \[\e[00;36m\]\t\[\e[01;00m\]\n\[\e[01;32m\]$EMOJI $\[\e[01;00m\] '

# export PS1='🦄\[\e[0;36m\] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\] ❯ '

export PS2='>'

# zoxide - Website: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"

# fzf - Website: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
