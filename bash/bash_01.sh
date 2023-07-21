#!/bin/bash

echo "Today is " `date`

echo "Enter the path to directory"

read the_path

echo "Your path has the following files and folders: "

ls $the_path