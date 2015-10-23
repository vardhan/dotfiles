alias ta='tmux attach'

# ctrl+s in VIM hangs.  To disable:
stty -ixon

# for grepping through specific types of files:
#   s <CSV of file extensions> <text to search>
function s {
  incl="";
  for x in "${(@s/,/)1}"; do
    incl="$incl --include *$x";
  done;
  shift;
  incl="-r --color=always --line-number$incl $@";
  grep "${=incl}"
}

# for finding a file by its name
function o { find -name "$@" }

export EDITOR="vim"
export TERM="xterm-256color"

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH

alias n="ninja -C out/Debug -j 1000"

[[ ( -f $HOME/.google.sh ) ]] && source $HOME/.google.sh
