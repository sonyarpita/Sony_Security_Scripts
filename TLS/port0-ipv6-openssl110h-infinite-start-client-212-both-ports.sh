
rm -rf output_p0_*
rm -rf output_p1_*
count=0
while :
do

Num_Client=`ps -ef | grep s_time | wc -l `
echo $Num_Client

if [ $Num_Client -eq 1 ]
then 
	count=`expr $count + 1`
	echo "Iteration: $count"

	if [ $count -eq 1 ]
	then
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:443' -www /1K &>> output_p0_alias_443
		echo "7" > /proc/sys/net/ipv4/tcp_syn_retries
	else 

		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:443'  -www /2G -time 120000000 &>> output_p0_alias_443 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:989'  -www /2G -time 120000000 &>> output_p0_alias_989 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:990'  -www /2G -time 120000000 &>> output_p0_alias_990 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:992'  -www /2G -time 120000000 &>> output_p0_alias_992 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:993'  -www /2G -time 120000000 &>> output_p0_alias_993 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:994'  -www /2G -time 120000000 &>> output_p0_alias_994 &

		for ((j=1001; j<=1100; j++))
			do
			env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:'"$j"''  -www /1K -time 120000000 &>> output_p0_alias_$j &
			done

		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:995'  -www /1G -time 120000000 &>> output_p1_alias_995 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:1364'  -www /1G -time 120000000 &>> output_p1_alias_1364 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:4116'  -www /1G -time 120000000 &>> output_p1_alias_4116 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:5349'  -www /1G -time 120000000 &>> output_p1_alias_5349 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:6514'  -www /1G -time 120000000 &>> output_p1_alias_6514 &
		env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:8531'  -www /1G -time 120000000 &>> output_p1_alias_8531 &
		for ((j=1101; j<=1200; j++))
			do
			env LD_LIBRARY_PATH="/root/compiled-openssl-1.1.0h/lib" ./openssl s_time -connect '[1000::96]:'"$j"''  -www /1M -time 120000000 &>> output_p1_alias_$j &
			done

	fi
else 
sleep 200 
fi
done 
