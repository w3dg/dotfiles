
# Python alias on Windows
alias python='winpty python.exe'
alias python3='winpty python.exe'

# Bash Aliases

# `ls` ALIASED TO `lsd` Website: https://github.com/Peltoche/lsd
# Can use `exa` as well Website: https://the.exa.website/
alias ls='lsd'
# alias ls='ls --color -F --group-directories-first' # for normal ls
alias ls='lsd --group-dirs first'
alias ll='ls -lAh --total-size'
alias l='ls -1'
alias la='ls -A'
alias sl='ls'
alias lls='ls'
# list all dotfiles
alias l.='/usr/bin/ls -A | grep "^\."' 
# clear all history ; even from the current session; close the session to get rid of all persistence
alias historyclearall="/usr/bin/cat /dev/null > ~/.bash_history && history -c && exit"
alias size="du -hcs ."
alias open='explorer'
alias man='tldr'
alias total_files='ls -l | wc -l'
alias tldr='tldr -t ocean'
alias cl="clear"

# Reload bashrc after modifying, in the current session
alias reload='source ~/.bashrc'

# confirm before overwriting something and verbose output
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Additional Programs replacing normal ones
# bat is a rust utility similar to the cat(1) command. install via scoop or other package manager
alias cat='bat'
# https://micro-editor.github.io/
alias mc='micro'
alias m='micro'
# Alias grep to ripgrep. Project home page: https://github.com/BurntSushi/ripgrep
alias grep='rg'
# Utility Aliases
# Get your external IP
# Public facing IP Address
alias ipe='curl ipinfo.io/ip'
alias myip='curl ip.appspot.com'

alias weather='curl wttr.in/'


# Custom Program Aliases

# reveal-md (see npm)
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337 --w --css style.css"
# Open Settings for Windows terminal
alias wtsetting="$EDITOR ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
