#!/bin/sh

FILE_PATH="../ex03/hh_positions.csv"
FILE_DEST="hh_uniq_positions.csv"

while IFS= read -r line
do
	echo $line

done < $FILE_PATH
