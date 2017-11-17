#@Author: Brent Hurst -- github: BrentHurst

# script that pulls Chris Dean's vimrc
# and makes slight changes to it
wget --backups=3 https://raw.githubusercontent.com/chrisdean258/vimrc/master/vimrc -O $HOME/.vimrc

Tabs=4

# change tabs from 8 to 4
sed -i "s/\t:set tabstop=./\t:set tabstop=${Tabs}/" $HOME/.vimrc
sed -i "s/\t:set shiftwidth=./\t:set shiftwidth=${Tabs}/" $HOME/.vimrc

# uncomment the last line to show colors better
sed -i "s/^\" :highlight Folded/:highlight Folded/" $HOME/.vimrc
