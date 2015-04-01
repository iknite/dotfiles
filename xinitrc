#! /bin/bash
if [ -s ~/.Xmodmap ]; then 
    xmodmap ~/.Xmodmap
fi
exec i3
