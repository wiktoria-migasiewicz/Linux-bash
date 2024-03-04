#!/bin/bash
#z6

#6.0
fun0() {
	if [ $(($1 - $2)) == 0 ]; then
		exit -1;
	fi
	wynik0=$((($1 + $2) / ($1 - $2)))
	echo $wynik0
}
#6.1
fun1() {
	double_factorial() {
		local n=$1
		if [ "$#" != 1 ]; then
			exit -1
		fi
		if (( n <= 1 )); then
			echo 1
		else	
			echo $(( n * $(double_factorial $((n - 2)))))
		fi
		
	}
	wynik1=$(double_factorial $1)
	echo $wynik1
}

#6.2
fun2() {
	if [ "$#" != 1 ]; then
		exit -1
	fi
	wynik2=1
	for (( j=$1; j>=0; j=$(($j-2))))
	do
		if [ $j == 0 ] || [ $j == 1 ]; then
			echo $wynik2
		else
			wynik2=$(($j * $wynik2))
		fi
	done
}

#6.3
fun3() {
	wynik3=0
	for x in "$@"; do
		if [[ $x =~ ^[0-9]+$ || $x =~ ^[-x]?[1-9][0-9]*$ ]]; then
			wynik3=$((wynik3 + x))
		fi
	done
	echo $wynik3
}
fun0 $1 $2
fun1 $1
fun2 $1
fun3 $1 $2 $3
