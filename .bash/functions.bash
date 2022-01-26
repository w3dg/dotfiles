### ARCHIVE EXTRACTION
# usage: extract <file>
ex()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Make a directory and cd into it all at once
mkcd() {
  mkdir $1 && cd $1
}

# compile and run a given java file. Usage - `jrun filename.java`
jrun() { 
  if [ -f "$1" ]; then
  local classname=`basename $1 .java`
  javac $1 && java $classname
  else echo "Usage - jrun filename.java . Either the file does not exist or you have not provided the correct file name"
  fi
}

# get a random emoji. Usage - `emoji`
emoji() {
  emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")
  EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}
  printf "$EMOJI \n"
}

# Spin up a local python server in the current directory. Usage - `up <port>` if not specified, uses port 8421
up() {
  if [ -n "$1" ]; then
  python -m http.server $1
  else echo "No port specified, running on a random port"
  local PORT=$(($RANDOM+3000))
  echo "Running on port $PORT"
  python -m http.server $PORT
  fi
}

#####################
## CAT OUT TODOSLIST
################
todo(){
	/usr/bin/cat ~/workspace/temp/TODO.md	
	printf "\n" 
}

# Uses fzf, fd
cd_with_fzf() {
    # cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
	cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

# Examples:
#     ix hello.txt              # paste file (name/ext will be set).
#     echo Hello world. | ix    # read from STDIN (won't set name/ext).
#     ix -n 1 self_destruct.txt # paste will be deleted after one read.
#     ix -i ID hello.txt        # replace ID, if you have permission.
#     ix -d ID

ix() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}
