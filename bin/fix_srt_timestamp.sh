#!/bin/sh

[ $# -ne 1 ] && echo "Ussage $(basename $0) SRTFILE" && exit 1

# if arg $1 not file
[ ! -f "$1" ] && echo "File $1 doesn't exists." && exit 1


#sed -r -e 's/^([0-9\.]+) --> ([0-9\.]+)$/___\1___\2___[$((\1 + 1))]___/g' "$1"
cat $1 | awk '{gsub(/^[0-9\.]+/, "*"); print $1}'

exit 0
