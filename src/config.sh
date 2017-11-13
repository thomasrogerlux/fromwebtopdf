#!/bin/bash

time=$(date --iso-8601="seconds")

wkhtmltopdf_flags="--print-media-type --encoding utf8 --disable-internal-links --disable-smart-shrinking --javascript-delay 2000"

wkhtmltopdf_bin="/usr/bin/wkhtmltopdf"

docker_flags="-u $(id -u) --net=host --rm -v $(pwd):/mnt -w /mnt"

log_file="log-$time.txt"

fail_file="fail-$time.txt"

RED='\033[1;31m'
GREEN='\033[1;32m'
NORMAL='\033[0m'
