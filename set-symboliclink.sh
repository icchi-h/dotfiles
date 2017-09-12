#!/bin/bash
# set-symboliclink.sh
#
# 2017/09/12
# Haruyuki Ichino <mail@icchi.me>>
# Version 0.1
#
# Description:
# ディレクトリ内のファイル・ディレクトリのホームディレクトリに存在しない場合(シンボリックリンク含む)、作成するスクリプト
#
# Usage:
#   $ sh set-symboliclink.sh
# ---------------------------------------------------------


# try-catch
set -eu
trap catch ERR
function catch() {
    echo "[ERROR]Fail in "$0
}

# const
SCRIPT_PATH=`dirname "${0}"`
SCRIPT_NAME=`basename "${0}"`
EXECUTION_LIST=($SCRIPT_NAME "README.md")


# roop for processing
for file in `\find . -maxdepth 1`; do
    filename=`basename $file`
    if `echo ${EXECUTION_LIST[@]} | grep -q "$filename"` ; then
        continue
    fi

    # check to exist file/directory
    echo $file
    if [ -e ~/$filename ]; then
        # 存在する場合
        echo "  Already exists ~/"$filename
    else
        # 存在しない場合
        abs_path=$(cd $(dirname $file) && pwd)/$(basename $file) # get asb path
        ln -s $abs_path ~
        echo "  Created symbolic link on ~/"$filename
    fi
done
