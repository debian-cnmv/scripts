#!/bin/bash
# run with sudo
while read user
do
	if deluser --remove-home $user
	then
		echo "Deleting user $user: OK"
	else
		echo "Deleting user $user: FAILED"
	fi
done
