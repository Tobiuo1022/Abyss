#!/bin/zsh

filepath=`pwd`/$0
root=${filepath%/*/*}

time (
    cat $root'/roast/testlist' | xargs raku $root'/other/client.p6'
)
