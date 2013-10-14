#!/usr/bin/env bash

rm -f config.cache config.log
autoscan
autoscan
rm -f configure.scan
aclocal
autoconf
autoheader
automake -ac --foreign --add-missing --copy
