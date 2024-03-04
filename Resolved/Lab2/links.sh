#!/bin/bash
#Z2

#2.1
mkdir -p "$1"

#2.2
cd "$1"
mkdir D1 D2 D3 D4
touch D2/F1.txt D3/F1.txt D4/F1.txt

#2.3
ln -s /etc/passwd D1/moje_hasla

#2.4
readlink D1/moje_hasla

#2.5
ln ./D3/F1.txt ./D2/F2.txt

#2.6
chmod 600 D2/F2.txt

#2.7
chown :users D2/F2.txt

#2.8
chgrp users D3

#2.9
chmod -x D3

#2.10
chmod -w D2

#2.11
chmod -r D4

#2.12
chmod +t D4

#2.13
touch D1/scr1.sh
chmod ug+x D1/scr1.sh
chmod o-x D1/scr1.sh

#2.14
chmod u+s D1/scr1.sh
chmod g+s D1/scr1.sh





