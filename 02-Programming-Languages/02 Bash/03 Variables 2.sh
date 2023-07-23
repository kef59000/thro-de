#!/bin/bash

echo "What is your name?"
read name

echo "How old are you?"
read age

echo "Hello $name, you are $age years old."

# Built-in variables
echo "$PWD, $SHELL, $USER, $HOSTNAME"

echo $twitter


sleep 2

echo "Calculating"

#Give me a random number 0-14 and add this to my age.
getrich=$((( $RANDOM % 15) + $age ))

echo "$name, you will become a millionaire when you are $getrich years old."