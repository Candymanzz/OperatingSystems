#!/bin/bash
count=0
for i in "$@"; do
	echo "$((++count)): $i"
done

