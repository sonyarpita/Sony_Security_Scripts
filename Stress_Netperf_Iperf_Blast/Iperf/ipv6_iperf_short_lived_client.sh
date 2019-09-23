ulimit -n 1024000

!/bin/bash
while [ 1 ]
do  
  for (( count=12000;count<=12050;count++ ))
  do

       iperf -c 1000::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1001::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1002::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1003::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1004::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1005::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1006::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1007::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1008::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1009::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 1010::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &

	echo $count
  done
   for (( count=12051;count<=12100;count++ ))
   do


       iperf -c 2000::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2001::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2002::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2003::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2004::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2005::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2006::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2007::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2008::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &
       iperf -c 2009::96 -V -p $count -w 512K -l 512k -t 900000 -P 2 &

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
