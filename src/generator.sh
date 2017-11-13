#!/bin/bash

source ./src/config.sh

list=$1
log_file=$2
fail_file=$3

function create_pdf {
	if [ ! $1 ] || [ ! $2 ]
	then
		return
	fi

	$wkhtmltopdf_bin $wkhtmltopdf_flags "$1" "dist/$2" &>> $log_file
	
	if [ $? = 0 ]
	then
		echo -e "[${GREEN}OK${NORMAL}] Generate $2 from $1"
	else
		echo "$1 $2" >> $fail_file
		echo -e "[${RED}KO${NORMAL}] Generate $2 from $1"
	fi
}

function main {
	cnt=0

	while read link
	do
		create_pdf $link &
		cnt=$((cnt+1))
		if [ $((cnt%10)) = 0 ]
		then
			wait
		fi
	done < $list

	wait
}

main