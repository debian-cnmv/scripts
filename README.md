# Scripts

## Creating users for `MySQL/MariaDB`

Create a simple **text file** and place on each line pairs like `user:user-password`.

Then run

```sh
./create_sql_users.sh path/to/file

```

or


```sh
./create_sql_users.sh

```

which tries to use `users.txt` file from the current directory.

The script creates  a `MySQL/MariaDB` *database* with the **same name** as the `user`.

The users have full access to their database.

## Setting quota limits for some users

Create a simple **text file** and place in it a user name on each line.

Then run

```sh
./set_users_quota.sh path/to/file
```

If you don't specify a file the user names are taken, line by line, from `stdin`.

## Create user dirs for public html

Create a simple **text file** and place in it a user name on each line.

Then run

```sh
./create_user_dirs.sh < users-file
```

