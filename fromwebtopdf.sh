#!/bin/bash

cd $(dirname $0)

source ./src/config.sh

rebuild=0
clean=0
log=0

function get_args {
    while [[ $# -gt 0 ]]
    do
        arg=$1
        case $arg in
            -r|--rebuild)
                rebuild=1
                shift
            ;;
            -c|--clean)
                clean=1
                shift
            ;;
			-l|--log)
				log=1
				shift
			;;
			-i|--input)
				list=$2
				shift
				shift
			;;
			-h|--help)
				cat "./src/helper.txt"
				exit
			;;
            *)
                echo "Error: Unknow option \"$1\""
                exit 1
            ;;
        esac
    done
}

function init {
	if [ $clean = 1 ]
	then
		rm -f log-*.txt
		rm -f fail-*.txt
	fi

	if [ $log = 0 ]
	then
		log_file="/dev/null"
	fi

	if [ ! -d "./dist" ]
	then
		mkdir "./dist"
	fi
}

function check_list {
	if [ -z $list ]
	then
		echo "Error: You have to specify a list"
		exit 1
	else
		if [ ! -f $list ]
		then
			echo "Error: The specified list does not exist"
			exit 1
		fi
	fi
}

function build_docker_image {
	echo -ne "[..] Build docker image (This may take a long time)\r"

	if [ $rebuild = 1 ]
	then
		docker build --no-cache -t fromwebtopdf -f ./docker/Dockerfile . >> $log_file
	else
		docker build -t fromwebtopdf -f ./docker/Dockerfile . >> $log_file
	fi

	if [ $? = 0 ]
	then
		echo -e "[${GREEN}OK${NORMAL}]"
	else
		echo -e "[${RED}KO${NORMAL}]"
		exit 1
	fi
}

function launch_container {
	docker run $docker_flags fromwebtopdf /mnt/src/generator.sh $list $log_file $fail_file
}

function main {
	get_args $@
	init
	check_list
	build_docker_image
	launch_container
}

main $@
