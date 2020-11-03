#!/bin/bash
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

declare -A singlet
echo ${singlet[@]}
read -p "Enter number of times u want to Flip the coin: " n
for (( f=1; f<=n; f++ ))
do
	flip=$((RANDOM%2))
	if (( $flip == 1 ))
	then
		singlet[$f]='H'
	else
		singlet[$f]='T'
	fi
done

echo ${singlet[@]}
for k in ${!singlet[@]} 
do
	if [[ ${singlet[$k]}:u == "H:u" ]]
	then
		echo "hello"
		((h++))
	else
		((t++))
	fi
done
echo "percentage of T = "$(awk "BEGIN{ print ( $h / $n ) * 100}")
echo "percentage of H = "$(awk "BEGIN{ print ( $t / $n ) * 100}")
