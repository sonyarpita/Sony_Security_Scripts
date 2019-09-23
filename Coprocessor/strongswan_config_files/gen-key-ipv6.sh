cd /usr/local/sbin/
./ipsec pki --gen > caKeyv6.der
./ipsec pki --self --in caKeyv6.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CA" --ca > caCertv6.der
./ipsec pki --gen > cool1Keyv6.der
./ipsec pki --pub --in cool1Keyv6.der | ./ipsec pki --issue --cacert caCertv6.der --cakey caKeyv6.der --dn "C=CH, O=blr.asicdesigners.com, CN=cool1v6" > cool1Certv6.der
./ipsec pki --gen > viper1Keyv6.der
./ipsec pki --pub --in viper1Keyv6.der | ./ipsec pki --issue --cacert caCertv6.der --cakey caKeyv6.der --dn "C=CH, O=blr.asicdesigners.com, CN=viper1v6" > viper1Certv6.der

#NOTE - Copy viper1Key.der, viper1Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
#rm -rf /usr/local/etc/ipsec.d/private/*
#rm -rf /usr/local/etc/ipsec.d/certs/*
#rm -rf /usr/local/etc/ipsec.d/cacerts/*
cp cool1Keyv6.der /usr/local/etc/ipsec.d/private/
cp cool1Certv6.der /usr/local/etc/ipsec.d/certs/
cp caCertv6.der /usr/local/etc/ipsec.d/cacerts/
cp cool1Keyv6.der /usr/local/etc/swanctl/private/
cp cool1Certv6.der /usr/local/etc/swanctl/x509/

#On Host2 -
#ssh viper1 "rm -rf /usr/local/etc/ipsec.d/private/*"
#ssh viper1 "rm -rf /usr/local/etc/ipsec.d/certs/*"
#ssh viper1 "rm -rf /usr/local/etc/ipsec.d/cacerts/*"
scp viper1Keyv6.der viper1:/usr/local/etc/ipsec.d/private/
scp viper1Certv6.der viper1:/usr/local/etc/ipsec.d/certs/
scp caCertv6.der viper1:/usr/local/etc/ipsec.d/cacerts/
scp viper1Keyv6.der viper1:/usr/local/etc/swanctl/private/
scp viper1Certv6.der viper1:/usr/local/etc/swanctl/x509/

cd /root/Sony/
