z=15001
for ((j=11; j<=30; j++ ))
do
echo "./btl.pl -c -n 5 -fip 102.1.1.77 -log -p $z "
./btl.pl -c -n 5 -fip 102.1.1.77 -log -p $z
z=`expr $z + 11 `
sleep 0.5
done
for ((j=31; j<=50; j++ ))
do
echo "./btl.pl -c -n 5 -fip 102.2.2.77 -log -p $z "
./btl.pl -c -n 5 -fip 102.2.2.77 -log -p $z
z=`expr $z + 11 `
sleep 0.5
done
