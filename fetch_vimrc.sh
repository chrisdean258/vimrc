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
	diff -u $UPDIR/vimrc_current_base $UPDIR/vimrc_new_base > $UPDIR/vimrc.patch
	yes | patch $UPDIR/vimrc_current $UPDIR/vimrc.patch
	sed -i "s/^LAST_UPDATE=.*/LAST_UPDATE=${NOW}/" $THIS_FILE
	mv $UPDIR/vimrc_new_base $UPDIR/vimrc_current_base
	mv $UPDIR/vimrc_current $MY_VIMRC
	rm -f $UPDIR/vimrc.patch $UPDIR/vimrc_current
fi
