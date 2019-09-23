ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"

for ((i=11; i<=20; i++))
do
ifconfig enp129s0f4:$i 102.$i.$i.21/24
ssh viper1 "ifconfig eth2:$i 102.$i.$i.96/24"
done

for ((i=21; i<=30; i++))
do
ifconfig enp129s0f4d1:$i 102.$i.$i.21/24
ssh viper1 "ifconfig eth3:$i 102.$i.$i.96/24"
done

for ((j=11; j<=30; j++))
do

declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done

 local_ip=102.$j.$j.21
 remote_ip=102.$j.$j.96
 ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
 ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0
 ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport



 local_ip=102.$j.$j.96
 remote_ip=102.$j.$j.21
ssh viper1 " ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"

done

echo "=====ip xfrm state list==== On COOL1"
ip xfrm state list 


echo "=====ip xfrm state list==== On VIPER1"
ssh viper1 "ip xfrm state list"





