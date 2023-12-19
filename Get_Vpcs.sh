#! /bin/bash
REGION=$1
echo $0
echo $1
aws ec2 describe-vpcs --region $1 | jq ".Vpcs[].VpcsId" -r

#! /bin/bash
REGION=$@
echo $REGION
if [ $# gt 0 ]
then
for REGION in $@
do
echo $REGION
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcsId" -r
echo "---------------------"
done
else
echo "you passed $# arguments"
 