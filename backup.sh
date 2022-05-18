#!/bin/bash

eval destination='~/backuptest/'
eval source='~/test/'

cp $source*.conf $source*.config ~/backuptest/ 2> /dev/null

lsDest=$(ls $destination | grep -E "*.conf|*.config")
lsSour=$(ls $source | grep -E "*.conf|*.config")

if [ "$lsDest" != "${lsSour:0}" ]
then
cp -i $destination*.conf $destination*.config $source -n
printf 'Backup!'
fi
