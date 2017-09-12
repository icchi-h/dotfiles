# My dotfiles basic
基本的なdotfilesの管理リポジトリ

## Usage

Download dotfiles & make set symbolic link on Home direcotory
```
git clone <ripository url>
cd <ripository>
sh set-symboliclink.sh
```

Set main shell script zsh
```
# install zsh
# brew install zsh ? yum install zsh ?

# check zsh path
which zsh

# set main shell
chsh -s <zsh path>
```

Install zsh plugin using zplug
```
zplug install
```


Install vim plugin using dein
```
# Open vim and install dein
$ vim
:call dein#install()
```
