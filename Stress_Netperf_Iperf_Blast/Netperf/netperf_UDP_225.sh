        for(( i=0; i<25; i++))
        do
		netperf -H $1 -p 12866 -t UDP_STREAM -l 60000000 -- -m 64 -s 32728 -S 32728 &
                netperf -H $1 -p 12868 -t UDP_STREAM -l 60000000 -- -m 1024 -s 32728 -S 32728 &
                netperf -H $1 -p 12870 -t UDP_STREAM -l 60000000 -- -m 1472 -s 32728 -S 32728 &
                netperf -H $1 -p 12872 -t UDP_STREAM -l 60000000 -- -m 1500 -s 32728 -S 32728 &
                netperf -H $1 -p 12874 -t UDP_STREAM -l 60000000 -- -m 2048 -s 32728 -S 32728 &
                netperf -H $1 -p 12876 -t UDP_RR -l 60000000 -- -r 1,1 &
                netperf -H $1 -p 12878 -t UDP_RR -l 60000000 -- -r 64,64 & 
                netperf -H $1 -p 12880 -t UDP_RR -l 60000000 -- -r 100,200 & 
                netperf -H $1 -p 12882 -t UDP_RR -l 60000000 -- -r 128,819 &

        done

