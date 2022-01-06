#!/bin/zsh

filepath=`pwd`/$0
root=${filepath%/*/*/*}

time (
for f (`cat $root/roast/test_list`)
do 
    $root/other/client $f
done
)

