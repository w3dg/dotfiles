# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Yarn PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load Up Some Cool ColorScripts!! https://gitlab.com/dwt1/shell-color-scripts
~/code/repos/Color-Scripts/color-scripts/dotx
# Echo the current date
echo "Today is $(date)"
echo ""

source ~/.bash/fortune.bash        # Fortune
source ~/.bash/bindings.bash       # Bindings
source ~/.bash/shopts.bash         # Shopts
source ~/.bash/exports.bash        # Exports
source ~/.bash/npm-completion.bash # Completions
source ~/.bash/functions.bash      # Custom functions
source ~/.bash/aliases.bash        # Aliases
source ~/.bash/git_aliases.bash    # Git aliases

# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
set input-meta on
set output-meta on
set convert-meta off

export PS1='\[\033]0;Bash \007\]'
export PS1='\[\e[01;32m\]notdg\[\e[00;33m\]@\[\e[1;34m\]victory\[\e[01;00m\]:\[\e[01;36m\]\w\[\e[00;32m\] `echo $(__git_ps1 "(%s)")`\n\[\e[01;35m\]❯\[\e[01;00m\] '
export PS2='>'

# zoxide - Website: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"

# fzf - Website: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Starship prompt - https://starship.rs
eval "$(starship init bash)"
