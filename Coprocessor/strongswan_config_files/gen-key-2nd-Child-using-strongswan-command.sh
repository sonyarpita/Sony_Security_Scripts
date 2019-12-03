strongswan pki --gen > caKeyp1.der
strongswan pki --self --in caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CAp1" --ca > caCertp1.der
strongswan pki --gen > aqua6Keyp1.der
strongswan pki --pub --in aqua6Keyp1.der | strongswan pki --issue --cacert caCertp1.der --cakey caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=aqua6p1" > aqua6Certp1.der
strongswan pki --gen > aqua5Keyp1.der
strongswan pki --pub --in aqua5Keyp1.der | strongswan pki --issue --cacert caCertp1.der --cakey caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=aqua5p1" > aqua5Certp1.der

#NOTE - Copy aqua5Key.der, aqua5Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
cp aqua6Keyp1.der /etc/strongswan/ipsec.d/private/
cp aqua6Keyp1.der /etc/strongswan/swanctl/private/
cp aqua6Certp1.der /etc/strongswan/ipsec.d/certs/
cp aqua6Certp1.der /etc/strongswan/swanctl/x509/
cp caCertp1.der /etc/strongswan/ipsec.d/cacerts/
#On Host2 -
scp aqua5Keyp1.der aqua5:/etc/strongswan/ipsec.d/private/
scp aqua5Keyp1.der aqua5:/etc/strongswan/swanctl/private/
scp aqua5Certp1.der aqua5:/etc/strongswan/ipsec.d/certs/
scp aqua5Certp1.der aqua5:/etc/strongswan/swanctl/x509/
scp caCertp1.der aqua5:/etc/strongswan/ipsec.d/cacerts/
cd
