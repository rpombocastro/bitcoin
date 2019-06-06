#!/bin/bash
# getpublicip.sh
echo 'getpublicip.sh started, writing public IP address every 5 minutes into /run/publicip'
while [ 0 ]; 
    do 
    printf "PUBLICIP=$(curl -vv ipinfo.io/ip 2> /run/publicip.log)\n" > /run/publicip;
    sleep 300
done;
