#!/bin/sh

SELF=`realpath ${BASH_SOURCE:-$0}`
SELF_DIR=`dirname ${SELF}`/../
APP_DIR=`realpath ${SELF_DIR}`
WORK_DIR=`realpath ${SELF_DIR}src/srt/`

cd ${WORK_DIR}
find . -maxdepth 3 -type f -name '*.srt' -print | xargs -i{} sh -c 'tail -v -n 3 {} | head -n 2'

exit 0
