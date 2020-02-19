#!/usr/bin/env sh

FAIL=1
SUCCESS=0

if [ $# -gt 1 ]; then
	echo "Too many arguments"
	echo "Usage: ./set_users_quota [file-name]"
	exit $FAIL
else
	if [ $# -eq 1 ]; then
		if [ -f "$1" ]; then
			while read -r user
			do
				##sudo setquota -u $user 100M 150M 0 0 /home
				echo "sudo setquota -u $user 100M 150M 0 0 /home"
				if [ $? -eq 0 ]; then
    				echo "Quota set for $user"
				else
    				echo "Failed to set quota for $user"
				fi
			done <"$1"
		else
			echo "Wrong file-name: $1"
			exit $FAIL
		fi
	else
		echo "Reading from stdin."
		echo "Enter user names line by line:"
		while read -r user; do
			##sudo setquota -u $user 100M 150M 0 0 /home
			echo "sudo setquota -u $user 100M 150M 0 0 /home"
			if [ $? -eq 0 ]; then
   				echo "Quota set for $user"
			else
   				echo "Failed to set quota for $user"
			fi
		done
	fi
fi
exit $SUCCESS
