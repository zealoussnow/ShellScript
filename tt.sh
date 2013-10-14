#!/usr/bin/env bash

MYDIR="/home/zealoussnow/wanwei/SerialPortProtocol/802/江苏神采"
for x in *
do
	echo -e  "\E[0;31m ${x} \E[0m"
	cd ${MYDIR}/${x}
	autogen.sh
	./configure --host=arm-linux
	make 
	make clean
	echo "over ${x}"
done
