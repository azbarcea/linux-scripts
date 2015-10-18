#!/bin/bash

# Licensed under CreativeCommons 
# Developed by Aaron Toponce atoponce aaron.toponce@gmail.com
# Copyright (c) Aaron Toponce 2015

function gen-monkey-pass(){
    [[ $(echo "$1"|grep -E '[0-9]+') ]] && NUM="$1" || NUM=1
    for I in $(seq 1 "$NUM"); do
        LC_CTYPE=C strings /dev/urandom|grep -o '[a-hjkmnp-z2-9-]'|head -n 16|paste -sd '' -
    done | column
}

function gen-xkcd-pass(){
    [[ $(echo "$1"|grep -E '[0-9]+') ]] && NUM="$1" || NUM=1
    SHWORDS=cracklib-small
    DICT=$(LC_CTYPE=C grep -E '^[a-Z]{3,6}$' /usr/share/dict/$SHWORDS)
    for I in $(seq 1 "$NUM"); do
        WORDS=$(echo "$DICT"|shuf -n 6|paste -sd ' ' -)
        XKCD=$(echo -n "$WORDS"|sed 's/ //g')
        echo "$XKCD ($WORDS)"|awk '{x=$1;$1="";printf "%-36s %s\n", x, $0}'
    done | column
}

gen-monkey-pass $@
gen-xkcd-pass $@
