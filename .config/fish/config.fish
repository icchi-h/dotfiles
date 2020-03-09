################################################################
# icchi's fish shell setting
################################################################

################################################
# PATH
################################################
# bin
set -x PATH $HOME/bin $PATH

# editor
set -x EDITOR vim

# node.js (nodebrew)
set -x PATH $HOME/.nodebrew/current/bin $PATH

# golang
if type -q go # `go`コマンドが存在すれば
    set -x -U GOROOT (go env GOROOT)
    set -x -U GOPATH $HOME/.go
    set -x -U PATH $GOROOT/bin $GOPATH/bin $PATH
end

# python
#
################################################

################################################
# Alias
################################################
# Preinstall
alias hist='history | fzf'

# Mac
alias o='open'

# python
alias python='python3'

# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# Tools
alias typora='open -a typora'
################################################

################################################
# Plugins
################################################
# fzf
set -U FZF_LEGACY_KEYBINDINGS 0

# oh-my-zsh/theme-bobthefish
set -g theme_display_date no

# enhancd
set -gx ENHANCD_FILTER "fzy:fzf:peco:percol:gof:pick:icepick:sentaku:selecta"
################################################
