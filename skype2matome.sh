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



ruby create_tex.rb $1
platex -kanji="utf-8" $1.tex
dvipdfmx $1
remove_tex_temp $1
evince "${1}.pdf" &
