#!/bin/bash

if [[ -z $1 ]]; then
    echo "No user specified!"
else
    if id "$1" &>/dev/null; then
        sudo pkill -KILL -u "$1"
    else
        echo "User $1 does not exist!"
    fi
fi
