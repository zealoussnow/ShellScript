#!/usr/bin/env bash

#============================================================================================
#
#         FileName: script.sh
#
#     Descriptions: 
#
#          Version: 1.0
#          Created: 2012-11-22 16:38:12
#         Revision: (none)
#
#           Author: xutao(mark), butbueatiful@gmail.com
#          Company: wanwei-tech
#
#============================================================================================
 
SRCDIR="/home/zealoussnow/gao/old/shencai_protocols/send_recv/"
SRCDIR2="code/src"
DESDIR="/home/zealoussnow/gao/new/"

cd ${SRCDIR}
for filename in *
do
	echo -e "\E[01;31m${filename} start....\E[0m"
	rm -rf ${DESDIR}/${filename} # 删除目标文件夹里有的相同目录

	cp -r ${DESDIR}/demo ${DESDIR}/${filename} # 将模版目录拷贝一份名字跟为 ${filename}
	rm -rf ${DESDIR}/script.sh
	cp $SRCDIR/${filename}/$SRCDIR2/* ${DESDIR}/${filename}/src/ # 将源码拷贝到上一步生成的目录的相应位置

	sed -i '5c INCLUDES=-I$(top_srcdir)/include' ${DESDIR}/${filename}/src/Makefile.am # 修改Makefile.am

	cd ${DESDIR}/${filename}
	rm -f config.cache config.log
	autoscan
	autoscan
	rm -f configure.scan
	aclocal
	autoconf
	autoheader
	automake -ac --foreign --add-missing --copy

	./configure --host=arm-linux
	make
	make clean

	git init
	git add .
	git commit -m "V1"
done
