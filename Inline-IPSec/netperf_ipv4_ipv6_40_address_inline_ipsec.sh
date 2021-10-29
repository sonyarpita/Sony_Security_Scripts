ssh viper1 "netserver -4 && netserver -6 -p 50000 && netserver -p 60000 && netserver -6 -p 40000"

function_traffic_ipv4() {
	for ((a=1; a<=20; a++))
	do
		echo "netperf -H $1 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K & netperf -H $1 -p 60000 -t UDP_STREAM -l 60000000 -- -m 2048 -s 32728 -S 32728"
		netperf -H $1 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -H $1 -p 60000 -t UDP_STREAM -l 60000000 -- -m 2048 -s 32728 -S 32728 &
	done
}


function_traffic_ipv6() {
	for ((a=1; a<=20; a++))
	do
		echo "netperf -6 -H $1  -p 50000 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K & netperf -6 -H $1 -p 40000 -t UDP_STREAM -l 6000000 -- -m 1500 -s 32728 -S 32728"
		netperf -6 -H $1 -p 50000 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -6 -H $1 -p 40000 -t UDP_STREAM -l 6000000 -- -m 1500 -s 32728 -S 32728 &
	done 
}
for ((i=11; i<=15; i++))
do
	function_traffic_ipv4 102.$i.$i.79
	function_traffic_ipv4 102.$((i+5)).$((i+5)).79
	function_traffic_ipv4 102.$((i+10)).$((i+10)).79
	function_traffic_ipv4 102.$((i+15)).$((i+15)).79
done

sleep 1

for ((i=1601; i<=1605; i++))
do
	function_traffic_ipv6 $i::79
	function_traffic_ipv6 $((i+5))::79
	function_traffic_ipv6 $((i+10))::79
	function_traffic_ipv6 $((i+15))::79

done

