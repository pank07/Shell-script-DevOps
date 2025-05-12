#!/bin/bash
#this is for loop and while

# Script to create folders from foldername1 to foldername10

for (( num=1; num<=10; num++ ))
do
  mkdir "class $num"
  done

  echo "Folders created:command 'ls -a'"

