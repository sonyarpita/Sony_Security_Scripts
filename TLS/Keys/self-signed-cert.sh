openssl genrsa -des3 -passout pass:x -out keypair.key 2048
openssl rsa -passin pass:x -in keypair.key -out server.key
openssl req -new -key server.key -out 012.345.678.90.csr
openssl x509 -req -days 365 -in 012.345.678.90.csr -signkey server.key -out server.crt
