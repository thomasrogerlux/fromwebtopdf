#!/bin/bash

source ./src/config.sh

export list=$1
export log_file=$2
export fail_file=$3
export parallel_runs=$4

function create_pdf {
	args=($@)

	url="${args[0]}"
	name="${args[1]}"

	if [ ! "$url" ] || [ ! "$name" ]
	then
		return
	fi

	$wkhtmltopdf_bin $wkhtmltopdf_flags $url "dist/$name" &>> $log_file
	
	if [ $? = 0 ]
	then
		echo -e "[${GREEN}OK${NORMAL}] Generate $name from $url"
	else
		echo "$url $name" >> $fail_file
		echo -e "[${RED}KO${NORMAL}] Generate $name from $url"
	fi
}

function main {
	echo "Starting pdf generation"
	export -f create_pdf
	parallel -j $parallel_runs -a $list create_pdf
	wait
}

main
