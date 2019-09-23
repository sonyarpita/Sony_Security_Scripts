
# NOTE - this script starts 212 connections on each IPalias IP. Thus the total connections = 212*20=4240 connections 

rm -rf output_p0_*
rm -rf output_p1_*
count=0
while :
do

myarr=$(ps -ef  | grep -i s_time | awk '{print $2}')
for i in "${myarr[@]}"
do
kill -9 $i &> /dev/null
#echo $i
done

Num_Client=`ps -ef | grep -i s_time | wc -l`
echo "Number of clients Active=$Num_Client"
sleep 10
if [ $Num_Client -eq 1 ]
then 
	count=`expr $count + 1`
	echo "Iteration: $count"

	if [ $count -eq 1 ]
	then
		./openssl s_time -connect 102.23.23.96:443 -www /1K &>> output_p0_alias_443
		echo "7" > /proc/sys/net/ipv4/tcp_syn_retries
	else 

		./openssl s_time -connect 102.23.23.96:443  -www /1M -time 12000 &>> output_p0_alias_443 &
		./openssl s_time -connect 102.23.23.96:989  -www /1M -time 12000 &>> output_p0_alias_989 &
		./openssl s_time -connect 102.23.23.96:990  -www /1M -time 12000 &>> output_p0_alias_990 &
		./openssl s_time -connect 102.23.23.96:992  -www /1M -time 12000 &>> output_p0_alias_992 &
		./openssl s_time -connect 102.23.23.96:993  -www /1M -time 12000 &>> output_p0_alias_993 &
		./openssl s_time -connect 102.23.23.96:994  -www /1M -time 12000 &>> output_p0_alias_994 &

		for ((j=1001; j<=1200; j++))
			do
			./openssl s_time -connect 102.23.23.96:$j  -www /1K -time 12000 &>> output_p0_alias_$j &
			done


                ./openssl s_time -connect 102.32.32.96:995  -www /2G -time 12000 &>> output_p1_alias_995 &
                ./openssl s_time -connect 102.32.32.96:1364  -www /2G -time 12000 &>> output_p1_alias_1364 &
                ./openssl s_time -connect 102.32.32.96:4116  -www /2G -time 12000 &>> output_p1_alias_4116 &
                ./openssl s_time -connect 102.32.32.96:5349  -www /2G -time 12000 &>> output_p1_alias_5349 &
                ./openssl s_time -connect 102.32.32.96:6514  -www /2G -time 12000 &>> output_p1_alias_6514 &
                ./openssl s_time -connect 102.32.32.96:8531  -www /2G -time 12000 &>> output_p1_alias_8531 &

		for ((j=1001; j<=1200; j++))
			do
			./openssl s_time -connect 102.32.32.96:$j  -www /1K -time 12000 &>> output_p1_alias_$j &
			done

	fi

sleep 60

else 
sleep 2 
fi
done 
