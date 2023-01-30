#!/usr/bin/env sh

while  read -r user
do
			sudo usermod --shell /bin/bash $user
done

