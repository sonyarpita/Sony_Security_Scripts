rm -rf BSB_*
z=16001
for ((j=11; j<=50; j++ ))
do
echo "./btl.pl -s -n 5 -log -p $z"
./btl.pl -s -n 5 -log -p $z
z=`expr $z + 11 `
done
