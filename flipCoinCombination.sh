#!/bin/bash
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

declare -A singlet
declare -A singlet_per
declare -A doublet
declare -A doublet_per
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

for k in ${!singlet[@]} 
do
	if [[ ${singlet[$k]}:u == "H:u" ]]
	then
		((h++))
	else
		((t++))
	fi
done
per_H=$(awk "BEGIN{ print ( $h / $n ) * 100}")
per_T=$(awk "BEGIN{ print ( $t / $n ) * 100}")
singlet_per[H]=$per_H
singlet_per[T]=$per_T

for k in ${!singlet_per[@]}
do
	echo "$k :" ${singlet_per[$k]}"%"
done


echo "Flipping for Doublet"

for (( f=1; f<=n; f++ ))
do	
        flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
        if (( $flip1 == 1 & $flip2 == 1 ))
        then
                doublet[$f]='HH'
	elif (( $flip1 == 1 & $flip2 == 0 ))
        then
                doublet[$f]='HT'
	elif (( $flip1 == 0 & $flip2 == 1 ))
        then
                doublet[$f]='TH'
	else
                doublet[$f]='TT'
        fi
done
c1=0
c2=0
c3=0
c4=0
for k in ${!doublet[@]}
do
        if [[ ${doublet[$k]}:u == "HH:u" ]]
        then
                ((c1++))
        elif [[ ${doublet[$k]}:u == "HT:u" ]]
        then
                ((c2++))
 	elif [[ ${doublet[$k]}:u == "TH:u" ]]
        then
                ((c3++))
	else
                ((c4++))
        fi
done

per_HH=$(awk "BEGIN{ print $c1 / $n * 100}")
per_HT=$(awk "BEGIN{ print $c2 / $n * 100}")
per_TH=$(awk "BEGIN{ print $c3 / $n * 100}")
per_TT=$(awk "BEGIN{ print $c4 / $n * 100}")

doublet_per[HH]=$per_HH
doublet_per[HT]=$per_HT
doublet_per[TH]=$per_TH
doublet_per[TT]=$per_TT

for k in ${!doublet_per[@]}
do
        echo "$k :" ${doublet_per[$k]}"%"
done

