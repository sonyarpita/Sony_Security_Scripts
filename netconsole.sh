rmmod netconsole > /dev/null
modprobe netconsole netconsole=7900@10.193.80.79/eno1,7900@10.193.80.62/18:03:73:f8:ac:e2
echo 9>/proc/sysrq-trigger

