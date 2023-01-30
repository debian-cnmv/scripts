#!/bin/bash

while read user
do
	sudo mkdir "/home/$user/public_html"
	if [ $? -eq 0 ]; then
		echo "Created /home/$user/public_html directory"
		sudo chown -R $user:www-data "/home/$user/public_html/"
		if [ $? -eq 0 ]; then
    		echo "Applyed $user:www-data to the directory"
		else
    		echo "Failed to apply $user:www-data to the directory"
		fi
	else
	    echo "Failed to create /home/$user/public_html directory"
	fi
done
