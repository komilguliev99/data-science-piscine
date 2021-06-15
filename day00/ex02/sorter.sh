#!/bin/sh

FILE_PATH=../ex01/hh.csv
FILE_DEST=hh_sorted.csv
LINES=$(cat ${FILE_PATH} | wc -l)

head -n 1 ${FILE_PATH} > ${FILE_DEST}
tail -n $((LINES-1)) ${FILE_PATH} > tmp.csv && 
	sort -t "," -k 2 -k 1 tmp.csv >> ${FILE_DEST} && rm tmp.csv
