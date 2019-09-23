ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list
ssh viper1 "ip xfrm state deleteall && ip xfrm policy flush && ip xfrm state list"
local_ip=102.1.1.21
remote_ip=102.1.1.96
ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport enc "cbc(aes)" 0xc286696d887c9aa0611bbb3e2025a45a sel src 0.0.0.0/0 dst 0.0.0.0/0
ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fde reqid 16385 mode transport enc "cbc(aes)" 0xc286696d887c9aa0611bbb3e2025a45a sel src 0.0.0.0/0 dst 0.0.0.0/0
ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport
ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport


local_ip=102.1.1.96
remote_ip=102.1.1.21
ssh viper1 "ip xfrm state add src $remote_ip dst $local_ip proto esp spi 0x53fa1fdd reqid 16386 mode transport enc \"cbc(aes)\" 0xc286696d887c9aa0611bbb3e2025a45a sel src 0.0.0.0/0 dst 0.0.0.0/0"
ssh viper1 "ip xfrm state add src $local_ip dst $remote_ip proto esp spi 0x53fa1fde reqid 16385 mode transport enc \"cbc(aes)\" 0xc286696d887c9aa0611bbb3e2025a45a sel src 0.0.0.0/0 dst 0.0.0.0/0 "
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir out tmpl src $local_ip dst $remote_ip proto esp reqid 16385 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir fwd tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"
ssh viper1 "ip xfrm policy add src $local_ip dst $remote_ip dir in tmpl src $local_ip dst $remote_ip proto esp reqid 16386 mode transport"

ip xfrm state list 
ssh viper1 "ip xfrm state list"
