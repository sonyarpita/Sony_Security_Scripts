ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
ssh stac16 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"

for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done


 ip xfrm state add src 20.1.1.21 dst 50.1.1.196 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp129s0f4 dir out
 ip xfrm state add src 50.1.1.196 dst 20.1.1.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0

 ip xfrm policy add src 20.1.1.0/24 dst 50.1.1.0/24 dir out tmpl src 20.1.1.21 dst 50.1.1.196 proto esp reqid 0x${reqid[1]} mode tunnel
 ip xfrm policy add src 50.1.1.0/24 dst 20.1.1.0/24 dir fwd tmpl src 50.1.1.196 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel
 ip xfrm policy add src 50.1.1.0/24 dst 20.1.1.0/24 dir in tmpl src 50.1.1.196 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel



ssh stac16 " ip xfrm state add src 20.1.1.21 dst 50.1.1.196 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh stac16 " ip xfrm state add src 50.1.1.196 dst 20.1.1.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "

ssh stac16 " ip xfrm policy add src 50.1.1.0/24 dst 20.1.1.0/24 dir out tmpl src 50.1.1.196 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel"
ssh stac16 " ip xfrm policy add src 20.1.1.0/24 dst 50.1.1.0/24 dir fwd tmpl src 20.1.1.21 dst 50.1.1.196 proto esp reqid 0x${reqid[1]} mode tunnel"
ssh stac16 " ip xfrm policy add src 20.1.1.0/24 dst 50.1.1.0/24 dir in tmpl src 20.1.1.21 dst 50.1.1.196 proto esp reqid 0x${reqid[1]} mode tunnel"

#ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"

for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done


 ip xfrm state add src 20.1.1.21 dst 30.1.1.96 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp129s0f4 dir out
 ip xfrm state add src 30.1.1.96 dst 20.1.1.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0

 ip xfrm policy add src 20.1.1.0/24 dst 30.1.1.0/24 dir out tmpl src 20.1.1.21 dst 30.1.1.96 proto esp reqid 0x${reqid[1]} mode tunnel
 ip xfrm policy add src 30.1.1.0/24 dst 20.1.1.0/24 dir fwd tmpl src 30.1.1.96 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel
 ip xfrm policy add src 30.1.1.0/24 dst 20.1.1.0/24 dir in tmpl src 30.1.1.96 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel



ssh viper1 " ip xfrm state add src 20.1.1.21 dst 30.1.1.96 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 " ip xfrm state add src 30.1.1.96 dst 20.1.1.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev ens3f4 dir out"

ssh viper1 " ip xfrm policy add src 30.1.1.0/24 dst 20.1.1.0/24 dir out tmpl src 30.1.1.96 dst 20.1.1.21 proto esp reqid 0x${reqid[2]} mode tunnel"
ssh viper1 " ip xfrm policy add src 20.1.1.0/24 dst 30.1.1.0/24 dir fwd tmpl src 20.1.1.21 dst 30.1.1.96 proto esp reqid 0x${reqid[1]} mode tunnel"
ssh viper1 " ip xfrm policy add src 20.1.1.0/24 dst 30.1.1.0/24 dir in tmpl src 20.1.1.21 dst 30.1.1.96 proto esp reqid 0x${reqid[1]} mode tunnel"

#ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
#ssh stac16 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"

for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done


 ip xfrm state add src 20.2.2.21 dst 50.2.2.196 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev eth1 dir out
 ip xfrm state add src 50.2.2.196 dst 20.2.2.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0

 ip xfrm policy add src 20.2.2.0/24 dst 50.2.2.0/24 dir out tmpl src 20.2.2.21 dst 50.2.2.196 proto esp reqid 0x${reqid[1]} mode tunnel
 ip xfrm policy add src 50.2.2.0/24 dst 20.2.2.0/24 dir fwd tmpl src 50.2.2.196 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel
 ip xfrm policy add src 50.2.2.0/24 dst 20.2.2.0/24 dir in tmpl src 50.2.2.196 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel



ssh stac16 " ip xfrm state add src 20.2.2.21 dst 50.2.2.196 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh stac16 " ip xfrm state add src 50.2.2.196 dst 20.2.2.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "

ssh stac16 " ip xfrm policy add src 50.2.2.0/24 dst 20.2.2.0/24 dir out tmpl src 50.2.2.196 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel"
ssh stac16 " ip xfrm policy add src 20.2.2.0/24 dst 50.2.2.0/24 dir fwd tmpl src 20.2.2.21 dst 50.2.2.196 proto esp reqid 0x${reqid[1]} mode tunnel"
ssh stac16 " ip xfrm policy add src 20.2.2.0/24 dst 50.2.2.0/24 dir in tmpl src 20.2.2.21 dst 50.2.2.196 proto esp reqid 0x${reqid[1]} mode tunnel"

#ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
#ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"

for i in {1..2}; do
  spi[i]=$(xxd -p -l 4 /dev/random)
done

declare -a reqid
for i in {1..2}; do
  reqid[i]=$(xxd -p -l 4 /dev/random)
done


 ip xfrm state add src 20.2.2.21 dst 30.2.2.96 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev eth1 dir out
 ip xfrm state add src 30.2.2.96 dst 20.2.2.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0

 ip xfrm policy add src 20.2.2.0/24 dst 30.2.2.0/24 dir out tmpl src 20.2.2.21 dst 30.2.2.96 proto esp reqid 0x${reqid[1]} mode tunnel
 ip xfrm policy add src 30.2.2.0/24 dst 20.2.2.0/24 dir fwd tmpl src 30.2.2.96 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel
 ip xfrm policy add src 30.2.2.0/24 dst 20.2.2.0/24 dir in tmpl src 30.2.2.96 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel



ssh viper1 " ip xfrm state add src 20.2.2.21 dst 30.2.2.96 proto esp spi 0x${spi[1]} reqid 0x${reqid[1]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 " ip xfrm state add src 30.2.2.96 dst 20.2.2.21 proto esp spi 0x${spi[2]} reqid 0x${reqid[2]} mode tunnel aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev ens3f4d1 dir out"

ssh viper1 " ip xfrm policy add src 30.2.2.0/24 dst 20.2.2.0/24 dir out tmpl src 30.2.2.96 dst 20.2.2.21 proto esp reqid 0x${reqid[2]} mode tunnel"
ssh viper1 " ip xfrm policy add src 20.2.2.0/24 dst 30.2.2.0/24 dir fwd tmpl src 20.2.2.21 dst 30.2.2.96 proto esp reqid 0x${reqid[1]} mode tunnel"
ssh viper1 " ip xfrm policy add src 20.2.2.0/24 dst 30.2.2.0/24 dir in tmpl src 20.2.2.21 dst 30.2.2.96 proto esp reqid 0x${reqid[1]} mode tunnel"

