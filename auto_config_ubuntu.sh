#!/bin/bash

function checkVimVersion() {
	vimloc=$(which vim || which vi)
	while [ -L $vimloc ]; do
		vimloc=$(ls -l $vimloc | sed -r 's/.+-> ([^ ]+).*/\1/')
	done
	vimViersion=$(echo $vimloc | sed -r 's/.+vim\.(.+)/\1/')
	echo -e "\033[32m vim version: $vimViersion\033[0m"
	if [ $vimViersion = basic ]; then
		return 0
	else
		return 1
	fi
}

function configVimBasic() {
	if checkVimVersion; then
		echo -e '\-33[32m无需升级VIM\033[0m'
	else
		echo -e '\033[32m升级VIM\033[0m'
		sudo apt-get remove vim-tiny vim-commoin
		sudo apt-get install -y vim
	fi
	sudo apt-get install -y git
	if [ -d ~/.vim/bundle/Vundle.vim ]; then
		echo -e '已经安装Vundle管理工具'
	else
		echo -e '安装Vundle管理工具'
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	echo -e '\033[32m配置用户的vim配置文件.vimrc\033[0m'
	cat ./vimBasicConf.vimrc > $HOME/.vimrc
	if [ -d ~/.vim/colors ]; then
		cp ./joit.vim ~/.vim/colors/
	else
		mkdir ./.vim/colors
		cp ./joit.vim ~/.vim/colors/
	fi
}

function configYouCompleteMe() {
	sudo apt-get install -y build-essential cmake
	sudo apt-get install -y python-dev python3-dev
}

function makeYouCompleteMe() {
	echo -e "\33[32m编译自动补全插件YouCompleteMe\033[0m"
	cd ~/.vim/bundle/YouCompleteMe
	./install.py --all
}

configVimBasic
configYouCompleteMe
echo -e "\033[32m正在进行插件安装……\033[0m"
vim +PluginInstall +qall
makeYouCompleteMe
