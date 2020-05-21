rm -rf text.txt
for ((i=31; i<=38; i++))
do
echo "gw-gw-$i {
     local_addrs  = 102.$i.$i.79
     remote_addrs = 102.$i.$i.77
     local {
        auth = pubkey
        certs = viper1p${i}Cert.der
        id = "C=CH, O=blr.asicdesigners.com, CN=viper1p$i"
     }
     remote {
        auth = pubkey
        id = "C=CH, O=blr.asicdesigners.com, CN=cool1p$i"
     }
     children {
        net-net-$i {
           #replay_window = 512
           rekey_time = 5400
           esp_proposals = aes128gcm96-x25519-esn-noesn
           #esp_proposals = aes128gcm96-x25519
           hw_offload = no
           mode = tunnel
        }
     }
     version = 2
     mobike = no
     reauth_time = 10800
     proposals = aes128-sha1-x25519
  }" >> text.txt

done

