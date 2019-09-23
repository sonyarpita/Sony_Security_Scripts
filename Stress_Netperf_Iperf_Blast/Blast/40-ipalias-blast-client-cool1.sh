z=15001
for ((j=11; j<=50; j++ ))
do
echo "./btl.pl -c -n 10 -fip 102.$j.$j.96 -log -p $z "
./btl.pl -c -n 10 -fip 102.$j.$j.96 -log -p $z
z=`expr $z + 11 `
done
