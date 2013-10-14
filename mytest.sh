#!/bin/bash
myprint()
{
	echo $@ 
	echo -n ""
	echo $#
	echo -e ""
	echo $*
}

myprint "nimei" "haha" "zaima" "quxizao"
