#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

flag=0


echo


if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi


# begin of user-list
echo "-----------------------------------"
echo "USERNAME              EXP DATE     "
echo "-----------------------------------"

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo -e "\e[0;36m-----------------------------------\e[0;0m"
echo ""
# end of user-list

read -p "What username do you want delete: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Are you sure want delete username ($username) [y/n]: " -e -i y REMOVE
	if [[ "$REMOVE" = 'y' ]]; then
		passwd -l $username
		userdel $username
		echo ""
		echo -e "\e[0;33mUsername ($username) was removed success !\e[0;0m"
        echo ""
	else
		echo ""
		echo -e "\e[0;31mUsername ($username) was canceled remove!\e[0;0m"
	fi
else
	echo -e "\e[0;31mUsername ($username) not register in this server!\e[0;0m"
	exit 1
fi

cd ~/
rm -f /root/IP
