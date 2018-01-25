get_files()
{
	wget -q https://raw.githubusercontent.com/chrisdean258/vimrc/master/vimrc -O $UPDIR/vimrc_new_base || exit 1
	cp $MY_VIMRC $UPDIR/vimrc_current
}

UPDIR=$HOME/.vim/auto_update
MY_VIMRC=$HOME/.vimrc

THIS_FILE=$0
LAST_UPDATE=1
NOW=`date +%s`
DIFF=`echo $NOW - $LAST_UPDATE | bc`

if ! [ -f $UPDIR/vimrc_current_base ] ; then
	wget -q https://raw.githubusercontent.com/chrisdean258/vimrc/master/vimrc -O $UPDIR/vimrc_current_base || exit 1
	cp $UPDIR/vimrc_current_base $MY_VIMRC
	exit 0
fi

#auto update every week
if [ $# -eq 0 ] || ( [ $1="auto" ] && [ $DIFF -gt 604800 ] ) ; then
	get_files
	diff -u vimrc_current_base vimrc_new_base > vimrc.patch
	yes | patch vimrc_current vimrc.patch
	sed -i "s/^LAST_UPDATE=.*/LAST_UPDATE=${NOW}/" $THIS_FILE
	mv vimrc_new_base vimrc_current_base
	mv vimrc_current $MY_VIMRC
	rm -f vimrc.patch vimrc_current
fi
