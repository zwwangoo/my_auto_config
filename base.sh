#!/bin/bash
echo -e "# ---------------------------------------------------- #"
echo -e "部署个人Linux环境，当前脚本仅适用与ubuntu系列"
echo -e "# ---------------------------------------------------- #"

case $1 in
	-sogou)
		wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb
		dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
		apt install -f 
		dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
		;;
	-zsh)
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "安装zsh"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_zsh && bash config && cd ../
		;;
	-vim)
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "配置和升级VIM"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_vim && bash config && cd ../
		;;
	-terminator)
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "安装配置terminator"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_terminator && bash config && cd ../
		;;
	-all | *)
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "正在进行安装，请耐心等待"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "正在安装VIM……"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_vim && bash config && cd ../
		sleep 5

		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "正在安装ZSH……"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_zsh && bash config && cd ../
		sleep 5

		echo -e "安装配置terminator"
		echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		cd ./auto_config_terminator && bash config && cd ../
		;;
esac
