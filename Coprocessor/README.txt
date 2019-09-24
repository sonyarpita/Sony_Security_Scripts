This folder contains - 
1. ip_xfrm_scripts
2. stres_crypto_test.tar.bz2  
3. strongswan_config_files


1. ip_xfrm_scripts 
------------------
-> This folder consists of scripts to setup IPSec tunnels without hardware offload 
-> Following is the description of each script -
* no-offload-configure-ip-xfrm-over-20-ipalias-cool1-being-server-viper1-being-client.sh -> Configures 20 IPSec tunnels between Host machine and Peer. Edit name of Peer and test IPs of both machines.  

* no-offload-configure-ip-xfrm-over-40-ipalias-cool1-being-server-viper1-being-client-256.sh -> Configures 40 IPSec tunnels between Host machine and Peer with 256-bit key. Edit name of Peer and test IPs of both machines.

* no-offload-configure-ip-xfrm-over-40-ipalias-cool1-being-server-viper1-being-client.sh -> Configures 40 IPSec tunnels between Host machine and Peer. Edit name of Peer and test IPs of both machines.

* no-offload-configure-ip-xfrm-over-IPv6-20-ipalias-cool1-being-server-viper1-being-client.sh -> Configures 20 IPv6 IPSec tunnels between Host machine and Peer. Edit name of Peer and test IPs of both machines.

* no-offload-transport-over-switch-cbc_aes.sh -> Configures 2 IPSec tunnels with aes-cbc cipher 

* no-offload-tunnel-over-3-machines-with-inter-vlan-configured.sh -> Configures IPSec tunnels across inter-vlan setup, assuming each machine has 2 ports. Refer http://wiki.asicdesigners.com/mediawiki/index.php/Inline_IPSec_Tunnel_using_%22ip_xfrm%22_over_Switch 


2. stres_crypto_test.tar.bz2
---------------------------
-> This tar file consists of test files of all sorts of sizes and a script which runs digests, encryption and decryption and speed tests on all these files. 
-> Copy compiled openssl binary to the untar'ed folder before running the script "loop_crypto.py"  

3. strongswan_config_files
--------------------------
-> This folder consists of : 
   * scripts to generate keys using a simple CA . Refer : https://wiki.strongswan.org/projects/strongswan/wiki/SimpleCA  
       ->> gen-key.sh - This script creates keys and copies keys to Peer machine as well. Change Peer name/IP 
       ->> gen-key-2nd-CHILD_SA.sh - This script creates keys for the 2nd Child SA and copies keys to Peer machine as well . Change Peer name/IP 
       ->> gen-key-using-strongswan-command.sh - This script creates keys using strongswan command and copies keys to Peer machine as well. Change Peer name/IP
   * Example ipsec.conf file that can be used a base for establishing 2 tunnels; 1 across each port 
   * Template ipsec.secrets file depicting the location of private key files



