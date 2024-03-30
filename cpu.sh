#! /bin/bash
# CPUutilization alert
CPU=`top -bn1  | awk '/Cpu/ {print $8}' | awk -F . '{print $1}'`
if [ $CPU -lt 90 ]
then
echo "High Utilization on $HOSTNAME  Kindly Check"
else
echo " CPU utilization is normal"
fi
