#!/bin/bash

red -p "Enter dir: " dir_name

current_der=$(pwd)

if cd "$dir_name"; then
	ls -l > directory_listing.txt
fi
