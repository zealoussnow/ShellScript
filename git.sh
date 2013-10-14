#!/bin/bash -x

SRCDIR="/home/zealoussnow/wanwei/SerialPortProtocol/802/江苏神采"
for x in *
do
	cd ${SRCDIR}/${x}
	git init
	git add .
	git commit -m "1.串口协议第一次整理"
done
