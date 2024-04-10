#!/bin/bash
STRING=$1
STR_LEN=$(expr ${#STRING} - 1)
STR_REV=''
echo $STR_LEN
for ((i = $STR_LEN; i >= 0; i--)); do
    X=${STRING[@]:$i:1}
    STR_REV=${STR_REV}$X
done
if [ ${STRING} = ${STR_REV} ]; then
    echo "$STRING is a pallindrome"
else
    echo "$STRING is not a pallindrome"
fi
