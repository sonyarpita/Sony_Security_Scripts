#!/bin/bash
startport=$1
endport=$2
if [ $# -ne 2 ]
then
  echo "Please specify the start and end range"
  exit
fi

for (( count=$startport ; count <=$endport ; count++ ))
do
  #iperf -s -u -p $count &
  iperf -s -V -p $count -w 512k &
done

