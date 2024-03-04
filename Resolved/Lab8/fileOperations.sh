#!/bin/bash
#Z8

#8.0

rozdzielanie() {
	local input_file="$1"
	local output_file1="$2"
	local output_file2="$3"
	[ -r "$input_file" ] || { echo "ERROR: Brak dostępu do pliku źródłowego."; exit -1; }
	for output_file in "$output_file1" "$output_file2"; do
		[ -e "$output_file" ] || touch "$output_file"
		[ -w "$output_file" ] || { echo "ERROR: Brak uprawnień do zapisu do pliku wyjściowego $output_file"; exit -1; }
		> "$output_file"
	done
	while IFS= read -r current_line; do
		random_number=$((RANDOM % 2))
		if [ "$random_number" -eq 0 ]; then
			echo "$current_line" >> "$output_file1"
		else
			echo "$current_line" >> "$output_file2"
		fi
	done < "$input_file"
	echo "Podział zakończony sukcesem"
}

echo "Zadanie 1."
rozdzielanie "$1" "$2" "$3"

tworzenie_struktury() {
	local base_path="$1"
	local filename="$2"
	if ! [ -d "$base_path" ]; then
		echo "ERROR: Brak katalogu o nazwie $base_path"
		exit -1
	fi
	if ! [ -w "$base_path" ]; then
		echo "ERROR: Brak uprawnień do zapisu do pliku $base_path"
		exit -1
	fi
	if ! [ -r "$base_path" ]; then
		echo "ERROR: Brak uprawnień do odczytu pliku $base_path"
		exit -1
	fi
	while IFS= read -r line || [ -n "$line" ]; do
		if [ -n "$line" ]; then
			mkdir -p "$base_path/$line"
			for i in {0..9}; do
				touch "$base_path/$line/F$i"
			done
		fi
	done < "$filename"
	echo "Tworzenie struktury zakończone sukcesem"
}

echo "Zadanie 2."
tworzenie_struktury "$4" "$5"




