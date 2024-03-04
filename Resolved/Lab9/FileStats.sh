#!/bin/bash

#Z9.0

statystyka() {

	local inputfile="$1"
	local outputfile="$2"
	declare -A word_count
	 
	if [ ! -r "$inputfile" ]; then
		echo "Błąd: Brak dostępu do pliku źródłowego."
		exit -1
	fi
	 
	if [ -e "$outputfile" ]; then
		if [ ! -w "$outputfile" ]; then
			echo "Błąd: Brak uprawnień do zapisu do pliku wyjściowego $outputfile."
			exit -1
	    fi
	else
	    touch "$outputfile" || { echo "Błąd: Nie można utworzyć pliku wyjściowego $outputfile."; exit -1; }
	fi

	while IFS= read -r line; do
		words=($line)
		for word in "${words[@]}"; do
    			if [ -n "$word" ]; then
        			((word_count["$word"]++))
    			fi
		done
	done < "$inputfile"

		for word in "${!word_count[@]}"; do
			echo "$word ${word_count[$word]}" >> "$outputfile"
	done | sort -k2,2nr > "$outputfile"

}

statystyka "$1" "$2"

