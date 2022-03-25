#!/bin/bash

while read user
do
    sudo chmod 711 /home/$user
	sudo chown -R $user:$user /home/$user/public_html/
    sudo chmod 755 /home/$user/public_html
done
