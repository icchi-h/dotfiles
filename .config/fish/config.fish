################################################################
# icchi's fish shell setting
################################################################

################################################
# PATH
################################################
# bin
set -x PATH $HOME/bin $PATH

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# editor
set -x EDITOR vim

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)

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

# Commands
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gch='git checkout'
alias gd='git diff'
alias ga='git add'
alias gp='git push'

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

################################################
# Style
################################################
set fish_color_command green
################################################
