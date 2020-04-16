ip xfrm state deleteall && ip xfrm policy flush
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush"
sleep 1
for ((i=11; i<=30; i++))
do
ifconfig enp129s0f4:$i 102.$i.$i.77/24
ssh viper1 "ifconfig enp4s0f4:$i 102.$i.$i.79/24"
done

for ((i=31; i<=50; i++))
do
ifconfig enp129s0f4d1:$i 102.$i.$i.77/24
ssh viper1 "ifconfig enp4s0f4d1:$i 102.$i.$i.79/24"
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

 local_ip=102.$j.$j.77
 remote_ip=102.$j.$j.79
 ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0
 ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
 ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport



 local_ip=102.$j.$j.79
 remote_ip=102.$j.$j.77
ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
#ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 " ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
usleep 1
done

for ((j=31; j<=50; j++))
do

declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done

 local_ip=102.$j.$j.77
 remote_ip=102.$j.$j.79
 ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0
 ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
 ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport



 local_ip=102.$j.$j.79
 remote_ip=102.$j.$j.77
ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
#ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 " ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x9742b970ff2c1713f11dc85dc52246140358ae4146d169eb54f8f31a311ff8cd46365b06 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
usleep 1
done

ip xfrm state list 
echo "*********************IP XFRM STATE LIST ON VIPER1***********************"
ssh viper1 "ip xfrm state list"




