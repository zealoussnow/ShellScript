#!/usr/bin/env bash
read yesno
case "${yesno}" in
	[Yy]*)
		echo "You input yes or y" ;;
	[Nn]*)
		echo "You input no or n" ;;
esac
