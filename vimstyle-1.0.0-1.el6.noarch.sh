#!/bin/bash

################ Script Info ################		

## Program: Auto Config VIM V1.0
## Author:Clumart.G
## Date: 2013-10-28
## Update:None


################ Env Define ################

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/sbin
LANG=C
export PATH
export LANG

################ Var Setting ################

InputVar=$*
HomeDir="/tmp/autoscript/"
SourceSiteDomain="https://github.com"
SourceUrl="${SourceSiteDomain}/AutoAndEasy/vimstyle/archive/master.zip"

################ Func Define ################ 
function _info_msg() {
_header
echo -e " |                                                                |"
echo -e " |                Thank you for use this script!                  |"
echo -e " |                                                                |"
echo -e " |                         Version: 1.0                           |"
echo -e " |                                                                |"
echo -e " |                     http://www.idcsrv.com                      |"
echo -e " |                                                                |"
echo -e " |                   Author:翅儿学飞(Clumart.G)                   |"
echo -e " |                    Email:myregs6@gmail.com                     |"
echo -e " |                         QQ:1810836851                          |"
echo -e " |                         QQ群:61749648                          |"
echo -e " |                                                                |"
echo -e " |          Hit [ENTER] to continue or ctrl+c to exit             |"
echo -e " |                                                                |"
printf " o----------------------------------------------------------------o\n"	
 read entcs 
clear
}

function _end_msg() {
echo -e "###################################################################"
echo ""
echo -e "                         Install Finish :)"
echo ""
echo -e "###################################################################"
echo ""
echo ""
_header
echo -e " |                                                                |"
echo -e " |                 Thank you for use this script!                 |"
echo -e " |                                                                |"
echo -e " |                The software has been installed!                |"
echo -e " |                                                                |"
echo -e " |                     http://www.idcsrv.com                      |"
echo -e " |                                                                |"
echo -e " |                   Author:翅儿学飞(Clumart.G)                   |"
echo -e " |                    Email:myregs6@gmail.com                     |"
echo -e " |                         QQ:1810836851                          |"
echo -e " |                         QQ群:61749648                          |"
echo -e " |                                                                |"
printf " o----------------------------------------------------------------o\n"
}

function _header() {
	printf " o----------------------------------------------------------------o\n"
	printf " | :: Auto Config VIM                         v1.0.0 (2013-10-28) |\n"
	printf " o----------------------------------------------------------------o\n"	
}

##Program Function

################ Main ################
clear
_info_msg

if [ ! -d $HomeDir ]; then
	mkdir -p $HomeDir
fi

cd $HomeDir || exit 1

#vim backup
[ -f ~/.vimrc ] && \cp -a ~/.vimrc ~/.vimrc.by_vimstyle_`date +%Y%m%d%H%M%S`.bak
[ -d ~/.vim ] && \cp -a ~/.vim ~/.vim.by_vimstyle_`date +%Y%m%d%H%M%S`.bak

#Get the source
yum -y install wget
wget --no-check-certificate ${SourceUrl} -O vimstyle.zip
if [ -f vimstyle.zip ]; then
    echo "Error:Download faild."
    exit 1
fi

#vimstyle install
unzip vimstyle.zip
cd vimstyle-master/ || exit 1

[ -f vimrc ] && \cp -a vimrc ~/.vimrc
[ -d vim ] && \cp -a vim ~/.vim

############  Clean Cache  ############
cd
rm -rf ${HomeDir}
_end_msg
