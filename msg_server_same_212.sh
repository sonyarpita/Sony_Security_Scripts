
rm -rf server_output_*

./openssl s_server -key /root/server.key -cert /root/server.crt -accept 443 -cipher $1  -WWW -msg  &>> server_output_443 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 989 -cipher $1  -WWW -msg  &>> server_output_989 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 990 -cipher $1  -WWW -msg  &>> server_output_990 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 992 -cipher $1  -WWW -msg  &>> server_output_992 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 993 -cipher $1  -WWW -msg  &>> server_output_993 & 
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 994 -cipher $1  -WWW -msg  &>> server_output_994 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 995 -cipher $1  -WWW -msg  &>> server_output_995 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 1364 -cipher $1  -WWW -msg  &>> server_output_1364 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 4116 -cipher $1  -WWW -msg  &>> server_output_4116 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 5349 -cipher $1  -WWW -msg  &>> server_output_5349 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 6514 -cipher $1  -WWW -msg  &>> server_output_6514 &
./openssl s_server -key /root/server.key -cert /root/server.crt -accept 8531 -cipher $1  -WWW -msg  &>> server_output_8531 &

for ((i=1001; i<=1200; i++))
do
./openssl s_server -key /root/server.key -cert /root/server.crt -accept $i -cipher $1  -WWW -msg &>> server_output_$i &
done

