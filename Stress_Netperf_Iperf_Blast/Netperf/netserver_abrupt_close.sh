# List of Arguments -
# $1 - start port
# $2 - range of ports

if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters"
    echo "+++++++++++++++++++++++++++++++++"
    echo "Please enter following parameters"
    echo "+++++++++++++++++++++++++++++++++"
    echo "Beginning port number"
    echo "Port number range"
    echo "=============================================================="
    echo "Example: [root@host~]# sh netserver_abrupt_close.sh 10000 500"
    echo "=============================================================="
    exit 2
fi


start=$1
range=$2

limit=`expr $start + $range`
#echo "Limit = $limit"
for (( count=$start; count<$limit; count++ ))
do
	z=`expr $count + $range`
	netserver -4 -p $count
	netserver -4 -p $z
done



