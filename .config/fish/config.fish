################################################################
# icchi's fish shell setting
################################################################

################################################
# PATH
################################################
# bin
set PATH $HOME/bin $PATH

# editor
set EDITOR vim

# node.js (nodebrew)
set PATH $HOME/.nodebrew/current/bin $PATH

# golang
if type -q go # `go`コマンドが存在すれば
    set GOROOT `go env GOROOT`
    set GOPATH $HOME/Programs/go
    set PATH $GOROOT/bin $GOPATH/bin $PATH
end
################################################

################################################
# Alias
################################################
# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
################################################

################################################
# Plugins
################################################
# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
################################################
