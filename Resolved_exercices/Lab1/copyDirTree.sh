#!/bin/bash
#Z1.1

#1
mkdir -p "$2"

#2
cp -r "$1" "$2"

#3
cd "$2"

#4
ls -l

#5
tree -h

#6
echo "Bezwdgledna sciezka do katalogu: $(pwd)"

#7
cd -

#8
rm -r "$2"
