#! /bin/bash
while true; do
read -p "enter number:" NUM
echo $NUM
if [ $(expr $NUM % 2) -eq 0 ]
then
    echo "$NUM is Even"
else
    echo "$NUM is Odd"
fi
done