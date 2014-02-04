#!/bin/sh
remove_tex_temp() {
    for name in "$1.aux" "$1.bbl" "$1.blg" "$1.dvi" "$1.out" "$1.log" "$1.tex"
    do
        if [ -e $name ];
        then
            rm $name
        fi
    done
    if [ -e ~/missfont.log ];
    then
        rm ~/missfont.log
    fi
}

filename=${1%%.*}


ruby create_tex.rb ${filename}
platex -kanji="utf-8" ${filename}.tex
dvipdfmx $filename
remove_tex_temp $filename
evince "${filename}.pdf" &
