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
SourceSiteDomain="https://github.com/"
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
if [ -f ~/.vimrc ]; then 
    \cp -a ~/.vimrc ~/.vimrc.`date +%Y%m%d%H%M%S`.bakbyvimstyle
fi
if [ -d ~/.vim ]; then
    \cp -a ~/.vim ~/.vim.`date +%Y%m%d%H%M%S`.bakbyvimstyle
fi

#Get the source
yum -y install wget
wget --no-check-certificate ${SourceUrl} -O vimstyle.zip

#vimstyle install
unzip vimstyle.zip
cd vimstyle-master/

\cp -a vimrc ~/.vimrc
\cp -a vim ~/.vim

_end_msg
############  Clean Cache  ############
rm -rf ${HomeDir}
