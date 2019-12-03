#cd /usr/local/sbin/
strongswan pki --gen > caKey.der
strongswan pki --self --in caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CA" --ca > caCert.der
strongswan pki --gen > aqua6Key.der
strongswan pki --pub --in aqua6Key.der | strongswan pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=aqua6" > aqua6Cert.der
strongswan pki --gen > aqua5Key.der
strongswan pki --pub --in aqua5Key.der | strongswan pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=aqua5" > aqua5Cert.der

#NOTE - Copy aqua5Key.der, aqua5Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
rm -rf /etc/strongswan/ipsec.d/private/*
rm -rf /etc/strongswan/swanctl/private/*
rm -rf /etc/strongswan/ipsec.d/certs/*
rm -rf /etc/strongswan/ipsec.d/cacerts/*
cp aqua6Key.der /etc/strongswan/ipsec.d/private/
cp aqua6Key.der /etc/strongswan/swanctl/private/
cp aqua6Cert.der /etc/strongswan/ipsec.d/certs/
cp aqua6Cert.der /etc/strongswan/swanctl/x509/
cp caCert.der /etc/strongswan/ipsec.d/cacerts/
#On Host2 -
ssh aqua5 "rm -rf /etc/strongswan/ipsec.d/private/*"
ssh aqua5 "rm -rf /etc/strongswan/swanctl/private/*"
ssh aqua5 "rm -rf /etc/strongswan/ipsec.d/certs/*"
ssh aqua5 "rm -rf /etc/strongswan/ipsec.d/cacerts/*"
scp aqua5Key.der aqua5:/etc/strongswan/ipsec.d/private/
scp aqua5Key.der aqua5:/etc/strongswan/swanctl/private/
scp aqua5Cert.der aqua5:/etc/strongswan/ipsec.d/certs/
scp aqua5Cert.der aqua5:/etc/strongswan/swanctl/x509/
scp caCert.der aqua5:/etc/strongswan/ipsec.d/cacerts/
cd

