#!/usr/bin/env sh

STATUS=0

while read user minq maxq
do
	sudo setquota -u $user $minq $maxq 0 0 /home
	if [ $? -eq 0 ]; then
		echo "Quota set for $user: min=$minq max=$maxq"
	else
		echo "Failed to set quota for $user"
		STATUS=1
	fi
done

exit $STATUS
