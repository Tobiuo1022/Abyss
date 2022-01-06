#!/bin/zsh

filepath=`pwd`/$0
root=${filepath%/*/*/*}

time (
    cat $root'/roast/test_list' | xargs raku $root'/other/client.p6'
)
