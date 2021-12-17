#!/bin/bash
# run with sudo
while read user
do
	sudo chmod o= /home/$user/
done

