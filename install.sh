#!/bin/sh

# options:
#     --right-ctrl=true        enable control to be overlap on left arrow key (long press)

FILE=default.conf

if [[ "$1" == "--right-ctrl=true" ]]; then
    sed -i -e '/#/d' -e '/left = overload/I,+1 d' $FILE
    
    sed -i '/\[main\]/a\\n# map left arrow to rightcontrol (long press)' $FILE
    sed -i '/#/aleft = overload(control, left)' $FILE
fi

mkdir -p /etc/keyd
cp $FILE /etc/keyd/default.conf
