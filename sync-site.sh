#!/bin/bash

IN=~/repos/site-laborator/public/
OUT=/var/www/html/

sudo rsync -av --delete $IN $OUT
