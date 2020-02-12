#/bin/sh

file="./users_quota.txt"

while IFS=: read -r user
do
	sudo setquota -u $user 100M 150M 0 0 /home
done <"$file"
