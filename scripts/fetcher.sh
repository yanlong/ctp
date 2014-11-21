#!/bin/bash
from=(${1//-/ })
to=(${2//-/ })

from[1]=`expr ${from[1]} - 1`
to[1]=`expr ${to[1]} - 1`

table_base_url="http://ichart.finance.yahoo.com/table.csv?a=${from[1]}&b=${from[2]}&c=${from[0]}&d=${to[1]}&e=${to[2]}&f=${to[0]}&s="

> dl.list

for i in $(seq 2000)
do 
	s=$(printf '%04d' $(expr $i - 1))
	# wget "${table_base_url}60$s.ss"
	echo "${table_base_url}60$s.ss" >> dl.list
done

# Batch download
wget -i dl.list

# Batch rename
for i in $(ls); do mv $i ${i##table*=};done
