#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

flag=0


echo


if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi


read -p "How many accounts to be created: " JUMLAH
read -p "How many days of active account: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo -e "\e[0;36m-----------------------------------\e[0;0m"
echo -e "\e[0;35mData Login\e[0;0m"
echo -e "\e[0;36m-----------------------------------\e[0;0m"
echo "Host/IP: $MYIP"
echo "Dropbear Port: 443, 110, 109"
echo "OpenSSH Port: 22, 143"
echo "Squid Proxy: 80, 8080, 3128"
for (( i=1; i <= $JUMLAH; i++ ))
do
	USER=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $USER
	#PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $USER:$USER | chpasswd
	
	echo "$i. Username/Password: $USER"
done

echo "Expried day: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo -e "\e[0;36m-----------------------------------\e[0;0m"

cd ~/
rm -f /root/IP
