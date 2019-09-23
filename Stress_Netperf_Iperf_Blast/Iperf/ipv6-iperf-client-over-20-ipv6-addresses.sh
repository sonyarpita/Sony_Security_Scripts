for ((i=1000; i<=1010; i++))
do
echo "Starting traffic over $::96"
iperf -V -c $i::96 
sleep 1
done

for ((i=2000; i<=2010; i++))
do
echo "Starting traffic over $::96"
iperf -V -c $i::96 
sleep 1
done

