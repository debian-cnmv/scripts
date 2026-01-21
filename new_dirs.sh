#!/bin/bash

while read user
do
	sudo mkdir "/home/$user/public_html"
	if [ $? -eq 0 ]; then
		echo "Created /home/$user/public_html directory"
        sudo chmod 711 /home/$user
	    sudo chown -R $user:$user /home/$user/public_html/
        sudo chmod 755 /home/$user/public_html
	else
	    echo "Failed to create /home/$user/public_html directory"
	fi
done
