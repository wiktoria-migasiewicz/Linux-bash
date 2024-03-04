#!/bin/bash
bubbleSort() {
  local array=("$@")
  local length=${#array[@]}
 
  for ((i = 0; i < length - 1; i++)); do
    for ((j = 0; j < length - i - 1; j++)); do
      if ! [[ ${array[j]} =~ ^[0-9]+$ ]] || ! [[ ${array[j + 1]} =~ ^[0-9]+$ ]]; then
        echo "Błąd: Argumenty powinny być liczbami całkowitymi."
        exit 1
      fi
 
      if [ ${array[j]} -gt ${array[j + 1]} ]; then
        # swap
        temp=${array[j]}
        array[j]=${array[j + 1]}
        array[j + 1]=$temp
      fi
    done
  done
 
  echo "Posortowane liczby: ${array[@]}"
}
 
tablica=(8 4 6 2 7)
sorted_array=($(bubbleSort "${tablica[@]}"))
echo "Przed sortowaniem: ${tablica[@]}"
echo "Po sortowaniu: ${sorted_array[@]}"
 
multiplicationTab() {
  if [ "$#" -ne 2 ]; then
    echo "Błąd: Funkcja powinna przyjmować dokładnie 2 argumenty."
    exit 1
  fi
 
  local rows=$1
  local columns=$2
 
  if ! [[ "$rows" =~ ^[0-9]+$ ]] || ! [[ "$columns" =~ ^[0-9]+$ ]]; then
    echo "Błąd: Argumenty powinny być liczbami całkowitymi i dodatnimi."
    exit 1
  fi
 
  local tab=()
  for ((i = 1; i <= rows; i++)); do
    for ((j = 1; j <= columns; j++)); do
      tab+=("$((i * j))")
    done
  done
 
  echo "Tabliczka mnożenia ${rows}x${columns}:"
  for ((i = 0; i < rows; i++)); do
    for ((j = 0; j < columns; j++)); do
      echo -n "${tab[i * columns + j]} "
    done
    echo ""
  done
}
multiplicationTab 3 3
 
#!/bin/bash
 
integration() {
  if [ "$#" -lt 3 ]; then
    echo "Błąd: Wymagane są co najmniej 3 argumenty."
    exit 1
  fi
 
  for arg in "$@"; do
    if ! [[ "$arg" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
      echo "Błąd: '$arg' nie jest liczbą rzeczywistą."
      exit 1
    fi
  done
 
  local num_args=$#
  local sum=0
 
  for ((i = 1; i < num_args; i++)); do
    c=$((i+1))
    current=$(echo "scale=2; (${!i} + ${!c}) / 2" | bc)
    sum=$(echo "scale=2; $sum + $current" | bc)
  done
 
  echo "Suma pól trapezu: $sum"
}
 
 
integration 0.0 1.0 2.0 3.0 4.0 5.0
 