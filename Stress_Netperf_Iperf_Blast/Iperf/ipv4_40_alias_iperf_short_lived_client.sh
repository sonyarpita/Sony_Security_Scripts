ulimit -n 1024000

!/bin/bash
while [ 1 ]
do  
  for (( count=12000;count<=12050;count++ ))
  do

       iperf -c 102.11.11.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.12.12.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.13.13.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.14.14.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.15.15.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.16.16.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.17.17.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.18.18.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.19.19.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.20.20.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.21.21.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.22.22.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.23.23.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.24.24.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.25.25.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.26.26.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.27.27.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.28.28.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.29.29.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.30.30.96 -p $count -w 512K -l 512k -t 900000 -P 2 &

	echo $count
  done
   for (( count=12051;count<=12100;count++ ))
   do

       iperf -c 102.30.30.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.31.31.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.32.32.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.33.33.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.34.34.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.35.35.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.36.36.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.37.37.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.38.38.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.39.39.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.40.40.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.41.41.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.42.42.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.43.43.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.44.44.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.45.45.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.46.46.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.47.47.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.48.48.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.49.49.96 -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 102.50.50.96 -p $count -w 512K -l 512k -t 900000 -P 2 &

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
sleep 10

done
