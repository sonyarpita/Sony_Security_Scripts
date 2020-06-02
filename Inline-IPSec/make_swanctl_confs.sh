rm -rf text.txt
for ((i=31; i<=38; i++))
do
echo "gw-gw-$i {
     local_addrs  = 102.$i.$i.77
     remote_addrs = 102.$i.$i.79
     local {
        auth = pubkey
<<<<<<< HEAD
        certs = cool1Certp${i}.der
        id = "C=CH, O=blr.asicdesigners.com, CN=cool1p$i"
=======
        certs = viper1Certp${i}.der
        id = "C=CH, O=blr.asicdesigners.com, CN=viper1p$i"
>>>>>>> 0269a5e02c1169747563daf6d7bb58cb0f888c18
     }
     remote {
        auth = pubkey
        id = "C=CH, O=blr.asicdesigners.com, CN=viper1p$i"
     }
     children {
        net-net-$i {
           #replay_window = 512
           rekey_time = 5400
           esp_proposals = aes128gcm96-x25519-esn-noesn
           #esp_proposals = aes128gcm96-x25519
           hw_offload = yes
           mode = tunnel
        }
     }
     version = 2
     mobike = no
     reauth_time = 10800
     proposals = aes128-sha1-x25519
  }" >> text.txt

done

