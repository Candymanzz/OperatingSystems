#!/bin/bash

read -p "(HH:MM) " target_time

while true; do
    current_time=$(date +%H:%M)

    echo "Time: $current_time"

    	if [ "$current_time" == "$target_time" ]; then
        cd /
        break
    fi

    sleep 30
done
