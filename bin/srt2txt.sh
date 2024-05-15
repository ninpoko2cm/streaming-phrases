#!/bin/sh

SELF=`realpath ${BASH_SOURCE:-$0}`
SELF_DIR=`dirname ${SELF}`/../
APP_DIR=`realpath ${SELF_DIR}`
# workdir
WORK_DIR=`realpath ${SELF_DIR}src/srt/`
SAVE_DIR=`realpath ${SELF_DIR}src/txt/`

# delete
rm -rf ${SAVE_DIR}
# copy
cp -R ${WORK_DIR} ${SAVE_DIR}
# rename
find ${SAVE_DIR} -maxdepth 3 -type f -name '*.srt' | xargs -L 1 rename 's/.srt/.txt/;'

# replace(srt to txt)
find ${SAVE_DIR} -maxdepth 3 -type f -name '*.txt' -print0 | xargs -0 -L 1 sed -i -e 's/^\xef\xbb\xbf//; s/\r//; s/^[0-9]*$//; /^[0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}$/d; /[0-9] --> [0-9]/d; s/^\s*$//; /^$/d;s/<[^>]*>//g'

exit 0
