#!/bin/bash
#Z3.1

#1
mkdir -p $1

#2
cat /etc/passwd | grep $(whoami)

#3
cut -d: -f1,6,7 < /etc/passwd | sort -r -t: -k1 > $1/F1.csv

#4
cut -d: -f7 /etc/passwd | sort -t: -k1 | uniq |rev > $1/F2.csv

#5
cut -d: -f1 /etc/passwd | tr '[:lower:]' '[:upper:]' > $1/F3.txt

#6
grep -C 4 $(whoami) /etc/passwd | sed '5d' > $1/F4.txt

#7
diff /etc/passwd $1/F4.txt > differences.txt
