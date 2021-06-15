#!/bin/sh

FILE_PATH="../ex02/hh_sorted.csv"
FILE_DEST="hh_positions.csv"
KEYWORDS=("Junior" "Middle" "Senior")

function join { local IFS="$1"; shift; echo "$*"; }

first_line=""

while IFS= read -r line
do
	if [ -z first_line ]; then
		echo $line > $FILE_DEST
		first_line="first line readed"
	fi

	readarray -d ,\  -t linearr <<< $line
	new_value=""
	#echo "START: ${linearr[2]}"
	for keyword in ${KEYWORDS[@]}
	do
		if [[ ${linearr[2],,} =~ .*"${keyword,,}".* ]]; then
			#echo "INNER: $new_value"
			if [ -z "$new_value" ]; then
				new_value=${keyword}
			else
				#echo "TEST: $keyword"
				new_value+="/"
				new_value+=$keyword
			fi
		fi
	done
	if [ -z $new_value ]; then
		new_value="-"
	fi
	linearr[2]=$new_value
	#echo ${linearr[2]}
	echo $(join , ${linearr[@]}) >> $FILE_DEST
done < $FILE_PATH
