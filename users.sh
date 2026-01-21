#!/bin/bash

defs="/etc/login.defs"
pass="/etc/passwd"

## get mini UID limit ##
min_id=$(grep "^UID_MIN" $defs)
echo "MIN: $min_id"

## get max UID limit ##
max_id=$(grep "^UID_MAX" $defs)
echo "MAX: $max_id"

## use awk to print if UID >= $MIN and UID <= $MAX and shell is not /sbin/nologin   ##
awk -F':' -v "min=${min_id##UID_MIN}" -v "max=${max_id##UID_MAX}"  '( $3 >= min && $3 <= max  && $7 != "/sbin/nologin" ) {print $1}' $pass
