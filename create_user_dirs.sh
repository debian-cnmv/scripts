#!/bin/bash

while read user
do
    echo "Creating public_html for user: $user"
	sudo mkdir /home/$user/public_html
    sudo chmod 711 /home/$user
    sudo chmod 755 /home/$user/public_html
done
