#!/bin/bash
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

declare -A singlet
declare -A singlet_per
declare -A doublet
declare -A doublet_per
declare -A triplet
declare -A triplet_per

read -p "Enter number of times u want to Flip the coin: " n
echo "***********************************************************************"
echo "Flipping for Singlet"
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

echo "***********************************************************************"
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

echo "***********************************************************************"
echo "Flipping for Triplet"

for (( f=1; f<=n; f++ ))
do
        flip1=$((RANDOM%2))
        flip2=$((RANDOM%2))
	flip3=$((RANDOM%2))
        if (( $flip1 == 1 & $flip2 == 1 & $flip3 == 1 ))
        then
                triplet[$f]='HHH'
	elif (( $flip1 == 1 & $flip2 == 1 & $flip3 == 0 ))
        then
                triplet[$f]='HHT'
	elif (( $flip1 == 1 & $flip2 == 0 & $flip3 == 1 ))
        then
                triplet[$f]='HTH'
	elif (( $flip1 == 0 & $flip2 == 1 & $flip3 == 1 ))
        then
                triplet[$f]='HTT'
	elif (( $flip1 == 0 & $flip2 == 0 & $flip3 == 1 ))
        then
                triplet[$f]='THH'
	elif (( $flip1 == 0 & $flip2 == 1 & $flip3 == 0 ))
        then
                triplet[$f]='THT'
	elif (( $flip1 == 0 & $flip2 == 1 & $flip3 == 1 ))
        then
                triplet[$f]='TTH'

        else
                triplet[$f]='TTT'
        fi
done
c1=0
c2=0
c3=0
c4=0
c5=0
c6=0
c7=0
c8=0
for k in ${!triplet[@]}
do
        if [[ ${triplet[$k]}:u == "HHH:u" ]]
        then
                ((c1++))
	elif [[ ${triplet[$k]}:u == "HHT:u" ]]
        then
                ((c2++))
	elif [[ ${triplet[$k]}:u == "HTH:u" ]]
        then
                ((c3++))
	elif [[ ${triplet[$k]}:u == "HTT:u" ]]
        then
            	((c4++))
	elif [[ ${triplet[$k]}:u == "THH:u" ]]
        then
                ((c5++))
	elif [[ ${triplet[$k]}:u == "THT:u" ]]
        then
                ((c6++))
	elif [[ ${triplet[$k]}:u == "TTH:u" ]]
        then
                ((c7++))
	else
		((c8++))
        fi
done

per_HHH=$(awk "BEGIN{ print $c1 / $n * 100}")
per_HHT=$(awk "BEGIN{ print $c2 / $n * 100}")
per_HTH=$(awk "BEGIN{ print $c3 / $n * 100}")
per_HTT=$(awk "BEGIN{ print $c4 / $n * 100}")
per_THH=$(awk "BEGIN{ print $c5 / $n * 100}")
per_THT=$(awk "BEGIN{ print $c6 / $n * 100}")
per_TTH=$(awk "BEGIN{ print $c7 / $n * 100}")
per_TTT=$(awk "BEGIN{ print $c8 / $n * 100}")

triplet_per[HHH]=$per_HHH
triplet_per[HHT]=$per_HHT
triplet_per[HTH]=$per_HTH
triplet_per[HTT]=$per_HTT
triplet_per[THH]=$per_THH
triplet_per[THT]=$per_THT
triplet_per[TTH]=$per_TTH
triplet_per[TTT]=$per_TTT

for k in ${!triplet_per[@]}
do
        echo "$k :" ${triplet_per[$k]}"%"
done
