# ctrl+s in VIM hangs.  To disable:
stty -ixon

alias ta='tmux attach';

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

function sr {
  # is this a dry run?
  dry_run="";
  if [ "$1" == "-i" ] ; then
    dry_run="-i.bak";
    shift;
  fi

  # which files to include
  incl="";
  for x in "${1/,/ /}"; do
    incl="$incl --include '*$x'";
  done;
  shift;

  # the search and replace text
  tofind=$1;
  toreplace=$2;
  cmd="grep ${incl} -l -R -e ${tofind} .";
  eval $cmd | xargs sed $dry_run "s/${tofind}/${toreplace}/g";
}

# for finding a file by its name
function o { find -name "$@" }

export EDITOR="vim";
export TERM="xterm-256color";

export GOPATH="$HOME/go";
export PATH=$PATH:$GOPATH;

alias n="ninja -C out/Debug -j 1000";

if [[ -f $HOME/.google.sh ]]; then
  source $HOME/.google.sh
fi
