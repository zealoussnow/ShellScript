#!/usr/bin/env bash

foo()
{
	echo "full argument: $*"
}

echo foo "$1"
