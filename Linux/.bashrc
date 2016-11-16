#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;35m\]\w\[\033[00m\] $ '

# dircolors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias all='systemctl --all'
alias failed='systemctl --failed'

# editor
export VISUAL="vim"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="/home/ip/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# tizen
export TIZEN_SDK_HOME="$HOME/.tizen-sdk"
export PATH=$PATH:$TIZEN_SDK_HOME/tools/ide/bin
source $TIZEN_SDK_HOME/tools/ide/bin/tizen-autocomplete

# grunt autocomplete
eval "$(grunt --completion=bash)"

# android studio
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

