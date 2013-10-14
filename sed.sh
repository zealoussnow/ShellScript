#!/usr/bin/env bash

SRCDIR="/home/zealoussnow/wanwei/SerialPortProtocol/FullVersion/阳光校园/"

cd ${SRCDIR}
for filename in *
do
	/bin/rm -rfv ${SRCDIR}/${filename}/src/${filename}
	PRONAME="${filename}_ZhangChengfei_`date +%Y%m%d%H%M%S`_w"
	/bin/rm -rfv ${SRCDIR}/${filename}/src/004_zhangchengfei_V201204270933_X
	echo -e "\E[01;31m${filename} start....\E[0m"
	sed -i '3c bin_PROGRAMS='${PRONAME} ${SRCDIR}/${filename}/src/Makefile.am 
	sed -i '10c '${PRONAME}'_SOURCES = main.c common.c \\''' ${SRCDIR}/${filename}/src/Makefile.am 
	cd ${SRCDIR}/${filename}
	aclocal
	autoconf
	autoheader
	automake -a
	make
done
