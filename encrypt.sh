#!/bin/bash
plain_text="$1"
shift_=$2
encrypted=""

if [[ -z $plain_text ]]; then exit; fi
for (( i = 0; i < ${#plain_text}; i++ ))
do
	characters="${plain_text:$i:1}"
	if [[ $characters =~ [A-Za-z] ]]
	then
		ascii_value=$(printf "%d" "'$characters")
		if [[ $characters =~ [A-Z] ]]
		then
			ascii_value=$(((ascii_value - 65 + shift_) % 26 + 65))
		elif [[ $characters =~ [a-z] ]]
		then
			ascii_value=$(((ascii_value - 97 + shift_) % 26 + 97))
		fi
		encrypted+=$(echo $ascii_value | awk '{printf("%c",$1)}')
	else
		encrypted+="$characters"
	fi
done
echo "$encrypted"
