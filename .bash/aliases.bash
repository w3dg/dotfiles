# Bash Aliases

# `ls` ALIASED TO `lsd` Website: https://github.com/Peltoche/lsd
# Can use `exa` as well Website: https://the.exa.website/
# alias ls='lsd'
# for normal ls
alias ls='ls --color -F --group-directories-first' 
# alias ls='ls --group-dirs first'
alias lt='ls -lAh --total-size'
alias ll='ls -lAh'
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
# bat is a rust utility similar to the cat(1) command. install via scoop or other package manager https://github.com/sharkdp/bat
alias cat='bat' 
# https://micro-editor.github.io/
alias mc='micro'
alias m='micro'
# Alias grep to ripgrep. Project home page: https://github.com/BurntSushi/ripgrep
alias grep='rg'
# Alias find to fd. Project home page - https://github.com/sharkdp/fd
alias find='fd'
# Alias curl to httpie - Project home page - https://github.com/httpie/httpie/
# https://www.hanselman.com/blog/installing-httpie-http-for-humans-on-windows-great-for-aspnet-web-api-and-restful-json-services
alias curl='http'
# Alias wget to use httpie - Project home page - https://github.com/httpie/httpie/
alias wget='http --download'

# Utility Aliases
# Get your external IP
# Public facing IP Address
alias ipe='curl ipinfo.io/ip'

# Get your weather information
alias weather='curl wttr.in/'

# Custom Program Aliases
# reveal-md (see npm)
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337 --w --css style.css"
# Open Settings for Windows terminal
alias wtsetting="$EDITOR ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

# Print Each Path entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

## NPM Project Aliases ##
alias vitenew='npm create vite@latest'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"


