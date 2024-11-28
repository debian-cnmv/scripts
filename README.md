# Scripts

## Creating users for `MySQL/MariaDB`

Create a simple **text file** and place on each line pairs like `user:user-password` and run


```sh
./create_sql_users.sh <  path/to/file

```

The script creates  a `MySQL/MariaDB` *database* with the **same name** as the `user`.

The users have full access to their database.

## Setting quota limits for some users

Create a simple **text file** and place there, on each line, the user name and the min and max 
quota limits like this:

```
joe 100M 150M
alice 200M 250M
bob 300M 400M
```

Then run:

```sh
./set_users_quota.sh < path/to/text-file
```

## Create user dirs for public html

Create a simple **text file** and place in it a user name on each line.

Then run

```sh
./create_user_dirs.sh < path/to/users-file
```

