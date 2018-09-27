################################################################
# icchi's zshrc
################################################################

################################################################
# PATH
################################################################
export PATH=$PATH:$HOME/usr/bin:/Users/icchi/programs/sh

# node.js
export PATH=$PATH:$HOME/.nodebrew/current/bin

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Android
export PATH=$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/Library/Android/sdk/android-ndk-r12b

# golang
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/Programs/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# React-Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
################################################################


################################################################
# Alias
################################################################
alias rm='rmtrash'
alias tree='tree -C' #treeの色付け
alias imgsize='sips --getProperty pixelWidth --getProperty pixelHeight'
alias gvim='mvim'
alias o='open'
alias ls='ls -GF'

# for java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# for Arduino
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'

# 無線LAN
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias wifipower='networksetup -setairportpower en0'

# Mac Vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/bin/mvim "$@"'

# homebrew config error for pyenv
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"
################################################################


################################################################
# ZSH
################################################################
# Color
autoload colors
colors
PROMPT="%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~ %{${fg[red]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

# ls color
# export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 大文字小文字無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# TAB補完時のハイライト
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

#Ctrl+Dで画面を閉じない
set -o ignoreeof
################################################################


################################################################
# Python
################################################################
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"

# virtualenv
eval "$(pyenv virtualenv-init -)"
# virtualenvでpromptを変更しない
export VIRTUAL_ENV_DISABLE_PROMPT=1

# pythonのimport error対策
export LC_ALL='ja_JP.UTF-8'
################################################################


################################################################
# zplug 
################################################################
source ~/.zplug/init.zsh
export ZPLUG_HOME=~/.zplug

# Theme
zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# prompt pure
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
autoload -U promptinit; promptinit
prompt spaceship

# syntax highlight
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# completion
zplug "zsh-users/zsh-completions"
zplug 'zsh-users/zsh-autosuggestions', defer:2  

# history
zplug "zsh-users/zsh-history-substring-search"
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# ENHANCD_HOOK_AFTER_CD=ls

# git
zplug "plugins/git",   from:oh-my-zsh

# wakatime
zplug "wbinglee/zsh-wakatime"

# tools
zplug "marzocchi/zsh-notify"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
################################################################
