# List of Arguments -
# $1 - start port
# $2 - range of ports

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



