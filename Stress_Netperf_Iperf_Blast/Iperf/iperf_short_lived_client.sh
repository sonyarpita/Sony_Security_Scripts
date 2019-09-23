!/bin/bash
while [ 1 ]
do  
  for (( count=13000;count<=13050;count++ ))
  do

       iperf  -c  102.23.23.96  -t 60 -l 512k  -w 512k  -p $count -P 5 &

	echo $count
  done
   for (( count=13051;count<=13100;count++ ))
   do

       iperf  -c  102.32.32.96  -t 60 -l 512k  -w 512k  -p $count -P 5 &

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
