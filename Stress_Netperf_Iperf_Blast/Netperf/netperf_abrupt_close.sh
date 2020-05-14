#rm -rf donye.txt
#!/bin/bash
#range specifies number of connections per port 
start=$1
range=$2
ip_of_port0=$3
ip_of_port1=$4

while [ 1 ]
do  
	limit=`expr $start + $range`
	echo "Limit = $limit"
	for (( count=$start; count<$limit; count++ ))
  	do
		z=`expr $count + $range`
		#echo "Ports for Port0 = $count"
		#echo "Ports for Port1 = $z"
		netperf -H $ip_of_port0 -p $count -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -H $ip_of_port1 -p $z -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
  	done
  	sleep 120

	myarr=$(ps -ef  | grep -i 'netperf -H' | awk '{print $2}')
	
	for i in "${myarr[@]}"
	do
		kill -9 $i
	done
	ps -ef | grep -i netperf

done

#rm -rf donye.txt
#for ((j=31; j<=38; j++))
#do
#        for(( i=0; i<200; i++))
#        do
#                netperf -H 102.$j.$j.79 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
#                netperf -H 102.$j.$j.79 -p 12865 -t TCP_MAERTS -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
#        done
#        echo "Done for 102.$j.$j.79" >> donye.txt
#done

