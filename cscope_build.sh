#!/bin/bash
#Author:bert
#Blog:http://blog.51cto.com/zpf666
#Time:2022-07-20 15:08:22
#Name:cscope_build.sh
#Version:V1.0
#Description:This is a production script.

dir=`pwd`
find $dir -name *.[chsS] > cscope.files
find $dir -name *.cpp >> cscope.files
cscope -Rkbq 

ctags -R --c-kinds=+p --fields=+S
current_dir=$PWD
echo current_dir: $current_dir
find $current_dir -name "*.c" -o -name '*.h' -o -name '*.s' -o -name '*.S' > $current_dir/cscope.files
cscope -Rbqk
CSCOPE_DB=$PWD/cscope.out
export CSCOPE_DB

echo "create cscope files ok"
