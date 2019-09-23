ip xfrm state deleteall && ip xfrm policy flush
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush"
declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done



local_ip=1000::21
remote_ip=1000::96
ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0
ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev enp129s0f4 dir out
ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
ip xfrm state list

local_ip=1000::96
remote_ip=1000::21
ssh viper1 "ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev ens3f4 dir out"
ssh viper1 "ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"

declare -a spi
for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done

local_ip=2000::21
remote_ip=2000::96
ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0
ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev eth1 dir out
ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport
ip xfrm state list

local_ip=2000::96
remote_ip=2000::21
ssh viper1 "ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0 offload dev ens3f4d1 dir out"
ssh viper1 "ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src ::/0 dst ::/0"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[1]} mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 0x${reqid[2]} mode transport"








