cd /usr/local/sbin/
./ipsec pki --gen > caKeyv6p1.der
./ipsec pki --self --in caKeyv6p1.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CAv6p1" --ca > caCertv6p1.der
./ipsec pki --gen > cool1Keyv6p1.der
./ipsec pki --pub --in cool1Keyv6p1.der | ./ipsec pki --issue --cacert caCertv6p1.der --cakey caKeyv6p1.der --dn "C=CH, O=blr.asicdesigners.com, CN=cool1v6p1" > cool1Certv6p1.der
./ipsec pki --gen > viper1Keyv6p1.der
./ipsec pki --pub --in viper1Keyv6p1.der | ./ipsec pki --issue --cacert caCertv6p1.der --cakey caKeyv6p1.der --dn "C=CH, O=blr.asicdesigners.com, CN=viper1v6p1" > viper1Certv6p1.der

#NOTE - Copy viper1Key.der, viper1Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
cp cool1Keyv6p1.der /usr/local/etc/ipsec.d/private/
cp cool1Certv6p1.der /usr/local/etc/ipsec.d/certs/
cp caCertv6p1.der /usr/local/etc/ipsec.d/cacerts/
cp cool1Keyv6p1.der /usr/local/etc/swanctl/private/
cp cool1Certv6p1.der /usr/local/etc/swanctl/x509/
#On Host2 -
scp viper1Keyv6p1.der viper1:/usr/local/etc/ipsec.d/private/
scp viper1Certv6p1.der viper1:/usr/local/etc/ipsec.d/certs/
scp caCertv6p1.der viper1:/usr/local/etc/ipsec.d/cacerts/
scp viper1Keyv6p1.der viper1:/usr/local/etc/swanctl/private/
scp viper1Certv6p1.der viper1:/usr/local/etc/swanctl/x509/

cd /root/Sony/
