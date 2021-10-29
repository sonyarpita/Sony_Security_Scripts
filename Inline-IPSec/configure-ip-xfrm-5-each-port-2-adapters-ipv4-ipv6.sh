
<< 'Following_IP_sequence_is_configured' 

cool1                          viper1 
---------------------------------------------------------
102.11.11.77 - 102.15.15.77 | 102.11.11.79 - 102.15.15.79
102.16.16.77 - 102.20.20.77 | 102.16.16.79 - 102.20.20.79
102.21.21.77 - 102.25.25.77 | 102.21.21.79 - 102.25.25.79 
102.26.26.77 - 102.30.30.77 | 102.26.26.79 - 102.30.30.79
1601::77     - 1605::77     | 1601::79     - 1605::79
1606::77     - 1610::77     | 1606::79     - 1610::79
1611::77     - 1615::77     | 1611::79     - 1615::79
1616::77     - 1620::77     | 1616::79     - 1620::79

ip xfrm state deleteall && ip xfrm policy flush
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush"
sleep 1

Following_IP_sequence_is_configured


ifconfig enp132s0f4d1 down
ifconfig enp129s0f4d1 down
ip link set enp129s0f4d1 name sony1
ip link set enp132s0f4d1 name sony2
ifconfig sony1 up
ifconfig sony2 up
sleep 1 

for ((i=11; i<=15; i++))
do
ifconfig enp129s0f4:$i 102.$i.$i.77/24 && ifconfig sony1:$((i+5)) 102.$((i+5)).$((i+5)).77/24 && ifconfig enp132s0f4:$((i+10)) 102.$((i+10)).$((i+10)).77/24 && ifconfig sony2:$((i+15)) 102.$((i+15)).$((i+15)).77/24 
ssh viper1 "ifconfig enp7s0f4:$i 102.$i.$i.79/24 && ifconfig enp7s0f4d1:$((i+5)) 102.$((i+5)).$((i+5)).79/24 && ifconfig ens4f4:$((i+10)) 102.$((i+10)).$((i+10)).79/24 && ifconfig ens4f4d1:$((i+15)) 102.$((i+15)).$((i+15)).79/24"
ping -c2 102.$i.$i.79
ping -c2 102.$((i+5)).$((i+5)).79
ping -c2 102.$((i+10)).$((i+10)).79
ping -c2 102.$((i+15)).$((i+15)).79
done

sleep 1

for ((i=1601; i<=1605; i++))
do
ip addr add $i::77/64 dev enp129s0f4 && ip addr add $((i+5))::77/64 dev sony1 && ip addr add $((i+10))::77/64 dev enp132s0f4 && ip addr add $((i+15))::77/64 dev sony2
ssh viper1 "ip addr add $i::79/64 dev enp7s0f4 && ip addr add $((i+5))::79/64 dev enp7s0f4d1 && ip addr add $((i+10))::79/64 dev ens4f4 && ip addr add $((i+15))::79/64 dev ens4f4d1"
done

for ((i=1601; i<=1620; i++))
do
	ping -c2 $i::79
done

sleep 1

function_establish_sa_ipv4(){
declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done

 local_ip=$1
 remote_ip=$2
 ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 replay-window 64 flag esn
 ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev $3 dir out replay-window 64 flag esn
 ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport


 local_ip=$2
 remote_ip=$1
ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev $4 dir out replay-window 64 flag esn"
#ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp4s0f4 dir out"
ssh viper1 " ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 replay-window 64 flag esn"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
sleep 1e-06 
}

function_establish_sa_ipv6(){
declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done

 local_ip=$1
 remote_ip=$2
 ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 replay-window 64 flag esn
 ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev $3 dir out replay-window 64 flag esn
 ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
 ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport


 local_ip=$2
 remote_ip=$1
ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev $4 dir out replay-window 64 flag esn"
#ssh viper1 " ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp4s0f4 dir out"
ssh viper1 " ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 replay-window 64 flag esn"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 " ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
sleep 1e-06
}

for ((a=11; a<=15; a++))
do
function_establish_sa_ipv4 102.$a.$a.77 102.$a.$a.79 enp129s0f4 enp7s0f4
function_establish_sa_ipv4 102.$((a+5)).$((a+5)).77 102.$((a+5)).$((a+5)).79 sony1 enp7s0f4d1
function_establish_sa_ipv4 102.$((a+10)).$((a+10)).77 102.$((a+10)).$((a+10)).79 enp132s0f4 ens4f4
function_establish_sa_ipv4 102.$((a+15)).$((a+15)).77 102.$((a+15)).$((a+15)).79 sony2 ens4f4d1
done

for ((a=1601; a<=1605; a++))
do
function_establish_sa_ipv6 $a::77 $a::79 enp129s0f4 enp7s0f4
function_establish_sa_ipv6 $((a+5))::77 $((a+5))::79 sony1 enp7s0f4d1
function_establish_sa_ipv6 $((a+10))::77 $((a+10))::79 enp132s0f4 ens4f4
function_establish_sa_ipv6 $((a+15))::77 $((a+15))::79 sony2 ens4f4d1
done


echo "*********************IP XFRM STATE LIST ON COOL1***********************"
ip xfrm state list 
echo "*********************IP XFRM STATE LIST ON VIPER1***********************"
ssh viper1 "ip xfrm state list"
