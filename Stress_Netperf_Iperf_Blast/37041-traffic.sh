for(( i=0; i<200; i++))
do
netperf -H 102.1.1.87 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
netperf -H 102.2.2.87 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
netperf -H 102.1.1.87 -p 12865 -t TCP_MAERTS -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
netperf -H 102.2.2.87 -p 12865 -t TCP_MAERTS -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
done

for(( i=0; i<200; i++))
do
netperf -H 102.1.1.87 -p 12865 -t UDP_STREAM -l 60000  -- -m 32768 &
netperf -H 102.2.2.87 -p 12865 -t UDP_STREAM -l 60000  -- -m 32768 &
done
