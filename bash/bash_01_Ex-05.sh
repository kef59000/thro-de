#!/bin/bash


# While Loop
x=1

while [[ $x -le 5 ]]
do
    read -p "Pushup $x: Press enter to continue."
    (( x++ ))
done


# This code reads each line from a file named input.txt and prints it to the terminal / a file. 
while read -r line
do
  echo $line
  echo $line >> output.txt
done < test_4.sh


# Until Loop
until [[ $order == "coffee" ]]
do
    echo "Would you like coffee or tea?"
    read order
done
echo "Excellent choice, here is your coffee."


# For Loop
# for cups in 1 2 3 4 5 6 7 8 9 10;
for cups in {1..10};
do
    echo "Hey, you had $cups of coffee today."
done


for x in google.com bing.com facebook.com florrrrrrrr.com;
do
    if ping -c 1 $x &> /dev/null; then
        echo "$x is up"
    else
        echo "$x is down"
    fi
done


for x in $(cat cities.txt);
do
    weather=$(curl -s http://wttr.in/$x?format=3)
    echo "The weather for $weather."
done


# Is a certain web page down?
echo "What do you want to check?"
read target

while true
do
    if ping -c 1 $target &> /dev/null; then
        echo "Hey, you are up"
        break
    else
        echo "$target is currently down"
    fi
sleep 2
done


echo "Welcome to the Hollywood Tower Hotel"
sleep 1
echo "Going up"
sleep 1

for x in {1..17};
do
    if [[ $x == 13 ]]; then
        continue
    fi
    echo "Floor $x"
    sleep 1
done