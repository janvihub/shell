#! /bin/bash
#check the utilization
alert=10
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 ,$6}' | while read -r output
do 
 disk=`echo $output |awk '{print $1}' | awk -F % '{print $1}'`
 partition=`echo $output | awk '{print $2}'`
 if [ $disk -ge $alert ] 
 then
 echo "Disk $partition is more than 10% on $HOSTNAME kindly do the housekeeping"
 fi 
done
