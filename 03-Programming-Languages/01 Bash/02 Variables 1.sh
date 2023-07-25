#!/bin/bash

# Option 1
# name="Florian"

# Option 2
# echo "What is your name?"
# read name

# Option 3
name=$1
compliment=$2

# Option 4
user=$(whoami)
date=$(date)
whereami=$(pwd)


# Main script
echo "Good Morning, $name!"
sleep 1

echo "You are looking good, $name!"
sleep 1

# echo "You have the best smile I have ever seen, $name."
echo "You have the best $compliment I have ever seen, $name."
sleep 2


echo "You are currently logged in as $user and you are in the directory $whereami. Also, today is: $date"