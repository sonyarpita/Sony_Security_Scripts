z=15001
for ((j=11; j<=30; j++ ))
do
echo "./btl.pl -c -n 5 -fip 102.$j.$j.79 -log -p $z "
./btl.pl -c -n 5 -fip 102.$j.$j.79 -log -p $z
z=`expr $z + 11 `
done
#for ((j=31; j<=50; j++ ))
#do
#echo "./btl.pl -c -n 5 -fip 104.$j.$j.77 -log -p $z "
##./btl.pl -c -n 5 -fip 104.$j.$j.77 -log -p $z
#z=`expr $z + 11 `
#done
for ((j=1601; j<=1620; j++ ))
do
echo "./btl.pl -c -n 5 -fip $j::79 -log -p $z "
./btl.pl -c -n 5 -fip $j::79 -log -p $z
z=`expr $z + 11 `
done

