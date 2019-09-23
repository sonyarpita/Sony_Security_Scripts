#!/usr/bin/perl


#------------------------------------------------------------------------------#
# Description   : Measure bulk data transfer performance for TCP Stream.
#               : How fast can data be sent from one system to another.
# Usage: ./Netperf_NetQ_TCP_UDP_STREAM.pl <IP address>
#------------------------------------------------------------------------------#

use strict;
use warnings;
system ("date");
sub usag(){
 print"=======================================================================\n";
print"  Usage: ./Netperf_NetQ_TCP_UDP_STREAM.pl <IP Address of Netserver>
           Ex: ./Netperf_NetQ_TCP_UDP_STREAM.pl 10.112.86.5\n";
 print"=======================================================================\n";
}
if($ARGV[0]){

my @listB = "";
my $sizeB = "";
my $a = "";
my $b = "";
my $i = "";
my $remote = "$ARGV[0]";


@listB = (
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 4096 -s 8192 -S 8192 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 4096 -s 32728 -S 32728 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 4096 -s 65536 -S 65536 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 8192 -s 8192 -S 8192 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 8192 -s 32728 -S 32728 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 8192 -s 65536 -S 65536 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 16384 -s 8192 -S 8192 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 16384 -s 32728 -S 32728 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 16384 -s 65536 -S 65536 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 32768 -s 8192 -S 8192 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 32768 -s 32728 -S 32728 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 32768 -s 65536 -S 65536 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 65536 -s 8192 -S 8192 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 65536 -s 32728 -S 32728 &",
    "netperf -H $remote -t TCP_STREAM -l 600 -- -m 65536 -s 65536 -S 65536 &",
    "netperf -H $remote -t TCP_RR -l 600 -- -r 1,1 &",
    "netperf -H $remote -t TCP_RR -l 600 -- -r 64,64 &",
    "netperf -H $remote -t TCP_RR -l 600 -- -r 100,200 &",
    "netperf -H $remote -t TCP_RR -l 600 -- -r 128,8192 &",
    "netperf -H $remote -t UDP_STREAM -l 600 -- -m 64 -s 32728 -S 32728 &",
    "netperf -H $remote -t UDP_STREAM -l 600 -- -m 1024 -s 32728 -S 32728 &",
    "netperf -H $remote -t UDP_STREAM -l 600 -- -m 1472 -s 32728 -S 32728 &",
    "netperf -H $remote -t UDP_STREAM -l 600 -- -m 1500 -s 32728 -S 32728 &",
    "netperf -H $remote -t UDP_STREAM -l 600 -- -m 2048 -s 32728 -S 32728 &",
    "netperf -H $remote -t UDP_RR -l 600 -- -r 1,1 &",
    "netperf -H $remote -t UDP_RR -l 600 -- -r 64,64 &",
    "netperf -H $remote -t UDP_RR -l 600 -- -r 100,200 &",
    "netperf -H $remote -t UDP_RR -l 600 -- -r 128,8192 &");

$sizeB = @listB;


#------------------------------------------------------------------------------#
# Loops.
#------------------------------------------------------------------------------#

for ($a=0; $a<=1000; $a++) {
    print "\n-> Iteration $a\n";
    for ($b=0; $b<$sizeB; $b++) {
        print "\n$listB[$b]\n";
        system ("$listB[$b]");
        sleep 15;
    }
sleep 200;
}



#------------------------------------------------------------------------------#
# eof.
#------------------------------------------------------------------------------#
}
else {

usag();
}

system ("date");
