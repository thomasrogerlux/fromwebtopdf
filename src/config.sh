#!/bin/bash

export time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

export wkhtmltopdf_flags="--print-media-type --encoding utf8 --disable-internal-links --disable-smart-shrinking --javascript-delay 2000"

export wkhtmltopdf_bin="/usr/bin/wkhtmltopdf"

export docker_flags="-u $(id -u) --net=host --rm -v $(pwd):/mnt -w /mnt"

export log_file="log-$time.txt"

export fail_file="fail-$time.txt"

export RED='\033[1;31m'
export GREEN='\033[1;32m'
export NORMAL='\033[0m'
