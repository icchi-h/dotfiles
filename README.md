# My dotfiles basic
基本的なdotfilesの管理リポジトリ

## Usage

Download dotfiles & make set symbolic link on Home direcotory
```
git clone --recursive https://github.com/icchi-h/dotfiles.git # clone with submodules (or git submodule init;git submodule update)
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
(** EC2の場合)
sudo chsh ec2-user
<zsh path>
```

Install zsh prompt
<https://github.com/sindresorhus/pure#getting-started>
```
npm install --global pure-prompt
```

Install zsh plugin using zplug
```
zplug install
```

Install fzy for using enhancd package
<https://github.com/jhawthorn/fzy#installation>


Install vim plugin using dein
```
# Open vim and install dein
$ vim
:call dein#install()
```
