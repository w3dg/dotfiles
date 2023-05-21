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
fortune | cowsay -f tux | lolcat

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵" "😊" "🤯" "👽" "🦄" "🐽" "🐍" "🦖" "🦕" "🐊" "🐢" "🐧" "💎" "🪄" "🍀" "🌈" "⚡" "🔥" "🌊")
EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

export PS1='\[\033]0;Bash \007\]'
# full user info
# export PS1='\[\e[01;32m\]\u\[\e[00;33m\]@\[\e[1;34m\]\h\[\e[01;00m\]:\[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "(%s)")`\n\[\e[01;35m\]❯\[\e[01;00m\] '

# export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]cal\[\e[01;00m\] \[\e[01;35m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \n\[\e[01;32m\]$EMOJI ❯\[\e[01;00m\] '
# export PS1='\n\[\e[00;31m\]dg@\[\e[01;31m\]bluestone\[\e[01;00m\] \[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "[%s]")` \n\[\e[01;32m\]$EMOJI λ\[\e[01;00m\] '

# Colors
light_green="\[\e[1;32m\]"
light_red="\[\e[1;31m\]"
yellow="\[\e[1;33m\]"
magenta="\[\e[1;35m\]"
gray="\[\e[0;37m\]"
reset="\[\e[m\]"

# Customize prompt
prompt_command() {
  # sync history between terminals
  history -a; # append to history file the current session
  history -c; # clear history for current session
  history -r; # read in the latest everywhere
  
  local status="$?"
  local status_color=""
  if [ $status != 0 ]; then
    status_color=$light_red
  else
    status_color=$light_green
  fi
  # export PS1="${gray}[${yellow}\w${gray}]$(__git_ps1)${reset} ${status_color}❯${reset} "
  export PS1="\n${magenta}[\w]${light_green}$(__git_ps1)${reset} \n${status_color}\$${reset} "
}

export PROMPT_COMMAND=prompt_command
export PS2='continue>'

# zoxide - Website: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"

# fzf - Website: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
