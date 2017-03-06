#!/bin/bash

# configure
cat <<EOM > /home/vagrant/.vimrc
source ~/.dots/vimrc
source ~/.dots/vim/appearance.dark.vim
EOM

cat <<EOM > /home/vagrant/.zshrc
source ~/.dots/zshrc
export PATH=~/bin:$PATH
export PATH=~/.nodebrew/current/bin:$PATH
EOM

cat <<EOM > /home/vagrant/.screenrc
source ~/.dots/screenrc
source ~/.dots/screen/dark
EOM

# apt
apt-get update -y
apt-get install -y apt-file automake build-essential g++ git graphviz imagemagick pandoc pdftk rlwrap ruby vim zsh jq unzip libncurses5-dev libncursesw5-dev texinfo
apt-get clean
apt-file update

# manual install
git clone https://github.com/cympfh/bin.git /home/vagrant/bin

cd ~
curl -L git.io/nodebrew | perl - setup
mv .nodebrew /home/vagrant/

mkdir /home/vagrant/Tools
cd /home/vagrant/Tools
wget -O vim-master.zip https://github.com/vim/vim/archive/master.zip
unzip vim-master.zip
mv vim-master vim
cd vim
./configure && make && make install
mkdir /home/vagrant/.vim
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/Vundle.vim

mkdir /home/vagrant/Tools
cd /home/vagrant/Tools
wget -O screen.tar.gz http://ftp.gnu.org/gnu/screen/screen-4.5.0.tar.gz
tar xf screen.tar.gz
cd screen-*
./configure && make && make install

# post-processing
chown -R vagrant:vagrant /home/vagrant/
