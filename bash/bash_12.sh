#!/bin/bash

# name="DE"

# echo "What is your name?"
# read name

name=$1
daytime=$2

user=$(whoami)
date=$(date)
whereami=$(pwd)

echo "Good $daytime $name!"
sleep 1
echo "You are looking good today $name!"
sleep 1
echo "That's amazing $name!"
sleep 2

echo "You are currently logge in as $user and you are in the directory $whereami. Also, today is: $date"

echo "$PWD, $SHELL, $USER, $HOSTNAME"