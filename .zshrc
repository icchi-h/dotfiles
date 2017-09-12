################################################################
# icchi's zshrc
################################################################

################################################################
# PATH
################################################################
export PATH=$PATH:$HOME/usr/bin:/Users/icchi/programs/sh

# golang
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/Programs/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
################################################################


################################################################
# Alias
################################################################
alias tree='tree -C' #treeの色付け

# for java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

export EDITOR=vim
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
autoload -U promptinit; promptinit
prompt pure

# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# ENHANCD_HOOK_AFTER_CD=ls

# wakatime
zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# history
zplug "zsh-users/zsh-history-substring-search"
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# tools
zplug "marzocchi/zsh-notify"
#zplug "oknowton/zsh-dwim"


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
