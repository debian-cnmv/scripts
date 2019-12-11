#!/bin/sh

SUCCESS=0
FAIL=1
FILE="./users.txt"

create_sql()
{
	while IFS=: read -r user pass
	do
		printf "CREATE DATABASE IF NOT EXISTS %s;\n" "$user"
		printf "CREATE OR REPLACE USER '%s'@'localhost' IDENTIFIED BY '%s';\n" "$user" "$pass" 
		printf "GRANT ALL ON %s.* TO '%s'@'localhost';\n" "$user" "$user" 
		printf "\n"
	done <"$FILE"
	echo "FLUSH PRIVILEGES;"
}


if [ $# -gt 1 ];
then
	echo "Usage: script-name [users-file]"
	echo "users-file must contain lines like user:password"
	echo "./users.txt is used if no file is specified"
	exit $FAIL
else
	if [ $# -eq 1 ];
	then
		FILE="$1"
	fi
fi

if [ -f "$FILE" ];
then

	create_sql > script.sql

	if [ $? -eq 0 ];
	then
		mysql -u root -p < script.sql
		cat ./script.sql
		rm -f ./script.sql
		exit $SUCCESS
	else
		echo "Something went wrong!"
		exit $FAIL
	fi
else
	echo "File $FILE not found!"
	exit $FAIL
fi
