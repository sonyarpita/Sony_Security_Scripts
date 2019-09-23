!/bin/bash
  for (( count=12001;count<=19605;count++ ))
  do

 #      iperf  -c  102.1.1.96  -t 6000000 -l 512k  -w 512k  -p $count   &
       iperf  -c  102.1.1.96  -t 6000000 -l 512k  -w 512k    &

	echo $count
  done
   for (( count=19607;count<=12962;count++ ))
   do

#       iperf  -c  102.2.2.96  -t 600000 -l 512k  -w 512k  -p $count  &
       iperf  -c  102.2.2.96  -t 600000 -l 512k  -w 512k    &

	echo $count
   done

