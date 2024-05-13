#!/bin/sh

[ $# -ne 1 ] && echo "Ussage $(basename $0) SRTFILE" && exit 1

# if arg $1 not file
[ ! -f "$1" ] && echo "File $1 doesn't exists." && exit 1


sed -r -e 's/^\xef\xbb\xbf//' \
    -e 's/\r//' \
    -e 's/^[0-9]*$//' \
    -e '/^[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}$/d' \
    -e '/^[0-9]+\.[0-9]+ --> [0-9]+\.[0-9]+$/d' \
    -e 's/^\s*$//' \
    -e '/^$/d;s/<[^>]*>//g' "$1"

exit 0
