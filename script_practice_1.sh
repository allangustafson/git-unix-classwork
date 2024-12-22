#!/bin/bash

echo -n "Enter file name. To end type q:"
read file_name
while [ "$file_name" != "q" ]; do
 touch $file_name
 echo -n "Enter file name. To end type q:"; read file_name
done
