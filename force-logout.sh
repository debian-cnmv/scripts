#!/bin/bash

if [[ -z $1 ]]; then
    echo "No user specified!"
else
    sudo pkill -KILL -u "$1"
fi
