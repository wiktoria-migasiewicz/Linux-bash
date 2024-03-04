#!/bin/bash
#Z.4

#4.1
mkdir -p $2

#4.2
find $1 -type f -name "*.txt"

#4.3
find $1 -type l

#4.4
find $1 -type f -name "*.sh" -executable

#4.5
find $1 -type d -name "[AaDd]"

#4.6
find $1 -type f -empty -user student

#4.7
find $1 -type f -size -1M -group student

#4.8
find $1 -type f -mmin -120

#4.9
find $1 -type d -perm -1000

#4.10
find $1 -type f \( -perm -4000 -o -perm -2000 \) -executable

#4.11
find /dev -type c -a -type b

#4.12
find $1 -type d -empty -exec rmdir {} \;

#4.13
find $1 -type f -size +100M -exec mv -t $2 {} \;

#4.14
find $1 -type d -name "Z*" -exec cp -r {} $2 \;




