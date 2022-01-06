#!/bin/zsh

filepath=`pwd`/$0
root=${filepath%/*/*/*}

time (
for f (`cat $root/roast/test_list`)
do 
    raku $root/other/client.p6 $f
done
)
