#! /bin/bash
I=0
while [ $I -le 5 ]; do
read -p "enter number:" NUM
echo $NUM
if [ $(expr $NUM % 2) -eq 0 ]
then
    echo "$NUM is Even"
else
    echo "$NUM is Odd"
fi
I=$(($I+1))
done