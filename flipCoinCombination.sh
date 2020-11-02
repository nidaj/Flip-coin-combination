#!/bin/bash
echo "This problem displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
flip=$((RANDOM%2))
if (( $flip == 1 ))
then
	echo "Heads"
else
	echo "Tails"
fi
