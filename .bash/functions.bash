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

# In JDK 11+ theres no need to do this separately, just `java filename.java`
# Compile and run a given java file. Usage - `jrun filename.java`
# One known caveat - if you have the file in a package, using this will remove that nested filepath. 
# Use dirname and basename to get the correct filepath to javac. Also the `./` path has to be removed from the filepath if any.
# I dont use this anymore hence, its `__`ed.
__jrun() { 
  if [ -f "$1" ]; then
  local classname=`basename $1 .java`
  javac $1 && java $classname
  else echo "Usage - jrun filename.java . Either the file does not exist or you have not provided the correct file name"
  fi
}

# JDK 11+
# Compile and run a given java file. Useful for small programs. Usage - `jrun filename.java`
jrun () {
  java $1
}

# get a random emoji. Usage - `emoji`
emoji() {
  emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")
  EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}
  printf "$EMOJI \n"
}

# Spin up a local python server in the current directory. Usage - `up <port>` if not specified, uses a random port
up() {
  re='^[0-9]+$' # Whether it is a number
  if [[ $1 =~ $re ]] ; then
    # port can be within 0-65535 only
    if ! [ $1 -ge 0 -a $1 -le 65535 ]; 
    then
      echo "Port number must be between 0 and 65535"
      return 
    fi  
     python -m http.server $1
  else
     echo "[i] Empty Or Invalid Port Number Specified." >&2;
     local PORT=$(($RANDOM+3000))
     echo -e "\e[33m Running on a random port: $PORT \e[0m"
     python -m http.server $PORT
  fi

  # if [ -n "$1" ]; then
  # python -m http.server $1
  # else 
  # local PORT=$(($RANDOM+3000))
  # echo -e "\e[33m[+] No port specified, running on a random port: $PORT \e[00m"
  # python -m http.server $PORT
  # fi
}

# Uses fzf, fd
cd_with_fzf() {
    # cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
	cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

cdf() {
	cd_with_fzf
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

# Qickly make a backup of a file
back() { 
	cp "$1"{,.bak};
}

# Grep current directories' files for todos etc
todos() {
	rg 'TODO|FIXME|WARN|BUG'
}

cleangit () {
  echo -e "WARNING: If you're on, say, a development branch that was branched off of master, you'll lose your master branch";
  echo -e "still want to do this? [y/N]";
  read REMOVE
  if [ "$REMOVE" = "y" ] || [ "$REMOVE" = "Y" ]; then
    git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
  fi
}
