rm -rf donye.txt
for ((j=31; j<=38; j++))
do
	for(( i=0; i<200; i++))
	do
		netperf -H 102.$j.$j.77 -p 12865 -t TCP_STREAM -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
		netperf -H 102.$j.$j.77 -p 12865 -t TCP_MAERTS -l 6000000 -Cc -- -m 256K  -M 256K -s 256K -S 256K &
	done
	echo "Done for 102.$j.$j.77" >> donye.txt
done
