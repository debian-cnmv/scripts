#!/usr/bin/env sh

(
while IFS=: read -r user pass
do
			echo "CREATE DATABASE IF NOT EXISTS $user;"
					echo "CREATE OR REPLACE USER $user@localhost IDENTIFIED BY '$pass';"
							echo "GRANT ALL ON $user.* TO $user@localhost;"
						done
						echo "FLUSH PRIVILEGES;"
						) | mysql -u root -p

