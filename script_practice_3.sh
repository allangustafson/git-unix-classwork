#!/bin/bash

echo "Name of script: $0"

if [ "$#" = "0" ]
then
  echo "You must provide one parameter"
elif [ "$#" -gt "1" ]
then
  echo "You must provide only one parameter"
else  
  test -d $1
  if [ "$?" = "0" ]
  then
    echo "Already exists"
  else
    mkdir "$1"
    echo "$1 directory created"
  fi
fi
