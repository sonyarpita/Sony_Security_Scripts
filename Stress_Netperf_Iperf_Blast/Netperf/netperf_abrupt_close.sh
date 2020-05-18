# List of Arguments -
# $1 - start port 
# $2 - range of ports 
# $3 - IP of Port0 of Peer 
# $4 - IP of Port1 of Peer 
#rm -rf donye.txt
#!/bin/bash
#range specifies number of connections per port 

if [[ $# -ne 5 ]]; then
    echo "Illegal number of parameters. Please enter following parameters"
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "Beginning port number"
    echo "Port number range"
    echo "IP of Peer's Port0"
    echo "IP of Peer's Port1"
    echo "Peer's corporate IP"
    echo "================================================================================================"
    echo "Example: [root@host~]# sh netperf_abrupt_close.sh 10000 500 102.1.1.79 102.2.2.79 10.193.80.79"
    echo "================================================================================================"
    exit 2
fi

start=$1
range=$2
ip_of_port0=$3
ip_of_port1=$4
iter=0
while [ 1 ]
do  
	iter=`expr $iter + 1`
	limit=`expr $start + $range`
	echo "Limit = $limit"
	for (( count=$start; count<$limit; count++ ))
  	do
		z=`expr $count + $range`
		#echo "Ports for Port0 = $count"
		#echo "Ports for Port1 = $z"
		netperf -H $ip_of_port0 -p $count -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -H $ip_of_port0 -p $count -t UDP_STREAM -l 6000000 -Cc -- -m 256  -M 256 -s 256 -S 256 &
		netperf -H $ip_of_port1 -p $z -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -H $ip_of_port1 -p $z -t UDP_STREAM -l 6000000 -Cc -- -m 256  -M 256 -s 256 -S 256 &
  	done
  	sleep 120

	myarr=$(ps -ef  | grep -i 'netperf -H' | awk '{print $2}')
	
	for i in "${myarr[@]}"
	do
		kill -9 $i
	done
	ps -ef | grep -i netperf >> KILLED_netperf.txt 
	sleep 60 
	echo "Completion of Iteration: $iter" >> KILLED_netperf.txt
	        
	if [ `expr $iter % 10` -eq 0 ]
        then
                echo "Clearing cache. Wait........"
                free -m
                echo 1 > /proc/sys/vm/drop_caches
                echo 2 > /proc/sys/vm/drop_caches
                echo 3 > /proc/sys/vm/drop_caches
                free -m
		ssh $5 "free -m && echo 1 > /proc/sys/vm/drop_caches && echo 2 > /proc/sys/vm/drop_caches && echo 3 > /proc/sys/vm/drop_caches && free -m"
        else
                echo "Continuing further"
        fi

done

