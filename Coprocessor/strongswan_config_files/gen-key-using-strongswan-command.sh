#cd /usr/local/sbin/
strongswan pki --gen > caKey.der
strongswan pki --self --in caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CA" --ca > caCert.der
strongswan pki --gen > cool1Key.der
strongswan pki --pub --in cool1Key.der | strongswan pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=cool1" > cool1Cert.der
strongswan pki --gen > viper1Key.der
strongswan pki --pub --in viper1Key.der | strongswan pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=viper1" > viper1Cert.der

#NOTE - Copy viper1Key.der, viper1Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
rm -rf /etc/strongswan/ipsec.d/private/*
rm -rf /etc/strongswan/swanctl/private/*
rm -rf /etc/strongswan/ipsec.d/certs/*
rm -rf /etc/strongswan/ipsec.d/cacerts/*
cp cool1Key.der /etc/strongswan/ipsec.d/private/
cp cool1Key.der /etc/strongswan/swanctl/private/
cp cool1Cert.der /etc/strongswan/ipsec.d/certs/
cp cool1Cert.der /etc/strongswan/swanctl/x509/
cp caCert.der /etc/strongswan/ipsec.d/cacerts/
#On Host2 -
ssh viper1 "rm -rf /etc/strongswan/ipsec.d/private/*"
ssh viper1 "rm -rf /etc/strongswan/swanctl/private/*"
ssh viper1 "rm -rf /etc/strongswan/ipsec.d/certs/*"
ssh viper1 "rm -rf /etc/strongswan/ipsec.d/cacerts/*"
scp viper1Key.der viper1:/etc/strongswan/ipsec.d/private/
scp viper1Key.der viper1:/etc/strongswan/swanctl/private/
scp viper1Cert.der viper1:/etc/strongswan/ipsec.d/certs/
scp viper1Cert.der viper1:/etc/strongswan/swanctl/x509/
scp caCert.der viper1:/etc/strongswan/ipsec.d/cacerts/
cd

