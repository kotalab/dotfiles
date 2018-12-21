# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
source $ZSH/oh-my-zsh.sh

alias o="open ."
alias a="open $1 -a /Applications/Atom.app"

alias zshrc="atom ~/.zshrc"

alias bundle!="bundle install && rake install"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias ri="rake install"

alias re="rbenv exec"
alias rebe="rbenv exec bundle exec"
alias rebi="rbenv exec bundle install"
alias rebu="rbenv exec bundle update"
alias reri="rbenv exec rake install"

alias gc="git checkout"
alias gco="git checkout"
alias gcm="git checkout master"
alias gpull="git pull"
alias gpush="git push"
alias gbranch="git checkout -b"
alias gclone="git clone"

alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"

alias doc="docker"
alias dr="docker rm"
alias dri="docker rmi"
alias dstop="docker stop"
alias dp="docker ps -a"
alias di="docker images"
alias dc="docker-compose"
alias dcup="docker-compose up -d"


export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
export LANG=ja_JP.UTF-8

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH=/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}
export PATH=/Library/Python/3.6/lib/python:$PATH

# Xcode via @orta
openx(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

# Go to the root of the current git project, or just go one folder up
function up() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# Powerline
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

# Git
function gcommit() {
  git add .
  git commit -m $1
}

# Init rbenv
eval "$(rbenv init -)"

# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
