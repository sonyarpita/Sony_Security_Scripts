#openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
#openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12
#openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -text -noout -pass cdrom888
openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 10000 -nodes
