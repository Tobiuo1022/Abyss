#!/bin/zsh

filepath=`pwd`/$0
root=${filepath%/*/*}
lib=$root'/roast/packages/Test-Helpers/'

time (
for f (`cat $root/roast/testlist`)
do 
    raku -I $lib $f
done
)
