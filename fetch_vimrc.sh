#!/bin/bash
#@Author: Brent Hurst -- github: BrentHurst

# script that pulls Chris Dean's vimrc
# and makes slight changes to it

MY_VIMRC=$HOME/.vimrc
THIS_FILE=$0

LAST_UPDATE=2017347
NOW=`date +%Y%j`

DIFF=`echo $NOW - $LAST_UPDATE | bc`

if [ $# -eq 0 ] || ( [ $1="auto" ] && [ $DIFF -gt 7 ] ) ; then
	Tabs=`cat $MY_VIMRC | grep -e "^\s:set tabstop=.$" | cut -d = -f 2`
	Update_command=`cat vimrc.bak | grep -e "let update_script" | cut -d \" -f 2`

	cat $MY_VIMRC | grep -e "^\" :highlight Folded ctermfg" &> /dev/null
	Highlight=$?

	#please dont ask -- hopefully i can fix it better later
	UPDATE_COMMAND=`cat $MY_VIMRC | grep -e "let update_script" | cut -d \" -f 2 | sed -e "s/\//\\\\\\\\\\//g"`


	wget --backups=3 https://raw.githubusercontent.com/chrisdean258/vimrc/master/vimrc -O $MY_VIMRC || exit 1

	# change tabs to prefered tab width
	sed -i "s/\t:set tabstop=./\t:set tabstop=${Tabs}/" $MY_VIMRC
	sed -i "s/\t:set shiftwidth=./\t:set shiftwidth=${Tabs}/" $MY_VIMRC

	# uncomment the last line to show colors better
	if [ $Highlight -eq 1 ]; then
		sed -i "s/^\" :highlight Folded/:highlight Folded/" $MY_VIMRC
	fi

	sed -i "s/.*let update_script.*/\t:let update_script= \"$UPDATE_COMMAND\"/" $MY_VIMRC

	sed -i "s/^LAST_UPDATE=.*/LAST_UPDATE=${NOW}/" $THIS_FILE
fi
