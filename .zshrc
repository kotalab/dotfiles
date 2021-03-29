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
alias vs="open $1 -a /Applications/Visual\ Studio\ Code.app"
alias zshrc="vs ~/.zshrc"
alias la="ls -a"

# bundler
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

# git
alias gc="git checkout"
alias gcm="git checkout master"
alias gpull="git pull"
alias gpush="git push"
alias gbranch="git checkout -b"
alias gclone="git clone"
alias gf="git fetch -p"
alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gall="git add ."

#docker
alias doc="docker"
alias dr="docker rm"
alias dri="docker rmi"
alias dic="docker images -f 'dangling=true' -q | xargs docker rmi"
alias dstop="docker stop"
alias dp="docker ps -a"
alias di="docker images"
alias dc="docker-compose"
alias dcup="docker-compose up -d"

alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export LANG=ja_JP.UTF-8

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Xcode via @orta
ox(){
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

alias cd="cdls"
function cdls() {
  builtin cd $1 && la
}
alias cdev="cd ~/Developer"

# Git
function gcommit() {
  git add .
  git commit -m $1
}

# rbenv
eval "$(rbenv init -)"

#mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

#git
export PATH="/usr/local/git/bin:$PATH"

#nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# resize via https://qiita.com/kinoleaf/items/df93150874bf0a6c9b9d#もう一歩
alias rs="resize"
function resize() {
  convert $1 -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB -resize 30% $2
}

# Create new tasks in Omnifocus via https://gist.github.com/brandonpittman/fd582d21eb00c12450b8
function NT () {
  if [[ $# -eq 0 ]]; then
    open -a "OmniFocus"
  else
    osascript <<EOT
    tell application "OmniFocus"
      parse tasks into default document with transport text "$@"
    end tell
EOT
  fi
}