local_ip=10.1.1.21
remote_ip=10.1.1.96
ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp129s0f4 dir out
ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fde reqid 16385 mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport


local_ip=10.1.1.96
remote_ip=10.1.1.21
ssh viper1 "ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 "ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fde reqid 16385 mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 offload dev enp129s0f4 dir out"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"
local_ip=20.1.1.21
remote_ip=20.1.1.96
ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fde reqid 16385 mode transport aead "rfc4106(gcm(aes))" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 
ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport


local_ip=20.1.1.96
remote_ip=20.1.1.21
ssh viper1 "ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 "ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fde reqid 16385 mode transport aead \"rfc4106(gcm(aes))\" 0x010203047aeaca3f87d060a12f4a4487d5a5c335 96 sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"
