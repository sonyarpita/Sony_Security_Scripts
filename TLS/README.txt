* create-all-sorts-of-files.sh -> This script creates files of sizes 1K, 1G, 1M and 2G

* create-files.sh -> This script creates files of sizes 1K, 1G, 1M and 2G

* infinite-ipalias-single-client-212-both-ports.sh -> This script starts 212 openssl 1.0.2d client connections on each IPalias IP. Thus the total connections = 212*20=4240 connections

* infinite-start-client-212-both-ports.sh -> This script starts 212 openssl 1.0.2d client connections. 106 connections per port

* inter-vlan-infinite-start-client-212-both-ports.sh -> This script starts 212 1.0.2d client connections. 106 connections per port. However the ports are configured with inter-vlan settings. 

* ipv4-server_openssl110h_same_212.sh -> This server script starts 212 IPv4 openssl 1.1.0h servers 

* ipv6_server_openssl110h_same_212.sh -> This server script starts 212 IPv6 openssl 1.1.0h servers

* ipv6_server_openssl111_same_212.sh -> This server script starts 212 IPv4 openssl 1.1.1 servers

* Keys -> This directory houses key and certificate files required for server 

* msg_server_same_212.sh -> This server script starts 212 IPv4 openssl 1.0.2d servers with debug enabled 

* openssl110h-infinite-start-client-212-both-ports.sh -> This script starts 212 openssl 1.1.0h client connections. 106 connections per port

* port0-ipv6-openssl110h-infinite-start-client-212-both-ports.sh -> This script starts 212 openssl 1.1.0h IPv6 client connections only on 1 port 

* port0-ipv6-openssl111-infinite-start-client-212-both-ports.sh -> This script starts 212 openssl 1.1.1 IPv6 client connections only on 1 port

* port0-openssl110h-infinite-start-client-212-both-ports.sh -> This script starts 212 openssl 1.1.0h IPv4 client connections only on 1 port

* server_same_212.sh -> This server script starts 212 IPv4 openssl 1.0.2d servers

* server_same_tls1_1_212.sh -> This server script starts 212 IPv4 openssl 1.0.2d tls1_1 servers

* short-lived-infinite-ipalias-single-client-212-both-ports.sh -> This script creates and abruptly kills 212 IPv4 openssl 1.0.2d client connections on each IPalias IP

* short-lived-infinite-single-client-212-both-ports.sh -> This script creates and abruptly kills 212 IPv4 openssl 1.0.2d client connections. 106 connections per port

