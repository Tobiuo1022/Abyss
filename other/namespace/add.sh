#!/bin/zsh

filepath=`pwd`/$0
other=${filepath%/*/*}

raku $other'/client.p6' $other'/namespace/stradd.p6' $other'/namespace/intadd.p6'
