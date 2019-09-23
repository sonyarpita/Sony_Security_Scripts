!/bin/bash
while [ 1 ]
do  
  for (( count=12000;count<=12050;count++ ))
  do

       iperf  -c  102.1.1.96  -t 60 -l 512k  -w 512k  -p $count -P 5 &

	echo $count
  done
   for (( count=12051;count<=12100;count++ ))
   do

       iperf  -c  102.2.2.96  -t 60 -l 512k  -w 512k  -p $count -P 5 &

	echo $count
   done

  sleep 30
  #sleep 120
#  killall iperf
myarr=$(ps -ef  | grep -i 'iperf -c' | awk '{print $2}')
for i in "${myarr[@]}"
do
kill -9 $i
done
ps -ef | grep -i iperf

done
