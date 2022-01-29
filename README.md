# My dotfiles basic

基本的なdotfileの管理リポジトリ

## Usage

Download dotfiles & make set symbolic link on Home direcotory

```fish
# clone with submodules (or git submodule init;git submodule update)
git clone --recursive https://github.com/icchi-h/dotfiles.git

cd <ripository>
sh set-symboliclink.sh
```

Set main shell script zsh

```fish
# install shell
# activate fish
fish

# set main shell
chsh -s (which fish)

(** EC2の場合)
sudo chsh ec2-user
<shell path>
```

Install fzy for using enhancd package
<https://github.com/jhawthorn/fzy#installation>

Install vim plugin using dein

```fish
# Open vim and install dein
$ vim
:call dein#install()
```
