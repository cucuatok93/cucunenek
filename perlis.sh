#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

flag=0


echo


if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
	
fi
	# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0

fi

# go to root
cd

echo ""
echo -e "\e[38;5;6m     ========================================================="
echo -e "\e[38;5;82m     *                 AUTOSCRIPT VPS 2018                   *"
echo -e "\e[38;5;6m     ========================================================="
echo -e "\e[38;5;6m     *                     Contact Me                        *"
echo -e "\e[38;5;6m     *                Channel: CuCuAtoK_TeaM                 *"
echo -e "\e[38;5;6m     *                Whatsapp: -                            *"
echo -e "\e[38;5;6m     *                Telegram: @Cucu_atok                   *"
echo -e "\e[38;5;196m     ========================================================="
echo -e "\e[38;5;226m     *                AUTOSCRIPT VPS 2018                    *"
echo -e "\e[38;5;6m     ========================================================="
# check registered ip
wget -q -O IP "https://raw.githubusercontent.com/cucuatok93/cucunenek/master/IP.txt"
if ! grep -w -q $MYIP IP; then
	echo -e "\e[38;5;196m Maaf Bro Hanya IP terdaftar sahaja yang boleh menggunakan Autoscript ini!!!" 
	if [[ $vps = "zvur" ]]; then
		echo -e "\e[38;5;226m PM Telagram: https://t.me/Cucu_atok untuk dapatkan harga diskaun kaw²\e[0m"
	else
		echo -e "\e[38;5;226m PM Telegram: https://t.me/Cucu_atok untuk dapatkan harga diskaun kaw²\e[0m"
	fi
	rm -f /root/IP
	exit
fi

 red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'

               echo -e "\e[38;5;82m Connecting to Autoscript CuCu_Atok..."
			   sleep 1

			   echo -e "\e[38;5;11m Connecting to your ip : $myip ...."
               sleep 2
                          echo -e "\e[38;5;13m Proses ini akan mengambil masa 10-15 minit"
		sleep 2.5	  
			   echo -e "\e[38;5;226m IP ANDA Berjaya Di Daftarkan..."
               sleep 1.5
               
			   echo -e "${green}Mula Setup...${NC}"
               sleep 1
	       cd
echo " "
echo "Do you want install webmin and openvpn ? "
read -n1 -r -p "Press Enter Key To Continue ..."
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
REMOVE SPAM PACKAGE


COMPLETE 10%
"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS 

PLEASE WAIT TAKE TIME 1-5 MINUTE
"
apt-get update;apt-get -y upgrade;apt-get -y install wget curl
echo "
INSTALLER PROCESS PLEASE WAIT


COMPLETE 10%
"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS 

PLEASE WAIT TAKE TIME 1-5 MINUTE
"
apt-get update;apt-get -y upgrade;apt-get -y install wget curl
echo "
INSTALLER PROCESS PLEASE WAIT

TAKE TIME 5-10 MINUTE
"
# login setting
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells

# Instal (D)DoS Deflate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to Cucu Atok Autoscript'
source="https://raw.githubusercontent.com/cucuatok93/cucunenek/master"
# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "$source/squid.conf"
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf


# openvpn
apt-get -y install openvpn
cd /etc/openvpn/
wget $source/openvpn.tar;tar xf openvpn.tar;rm openvpn.tar
wget -O /etc/iptables.up.rules "$source/iptables.up.rules"
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i "s/ipserver/$myip/g" /etc/iptables.up.rules
iptables-restore < /etc/iptables.up.rules
# etc
wget -O /home/vps/public_html/client.ovpn "$source/client.ovpn"
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn;cd
wget $source/cronjob.tar
tar xf cronjob.tar;mv uptimes.php /home/vps/public_html/
mv usertol userssh uservpn /usr/bin/;mv cronvpn cronssh /etc/cron.d/
chmod +x /usr/bin/usertol;chmod +x /usr/bin/userssh;chmod +x /usr/bin/uservpn;
useradd -m -g users -s /bin/bash sshvpn
echo "atok:123456" | chpasswd

# setting port ssh
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/Port 22/Port  22/g' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 110"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
service ssh restart
service dropbear restart


# install fail2ban
apt-get -y install fail2ban;
service fail2ban restart

# install webmin
cd
wget "http://prdownloads.sourceforge.net/webadmin/webmin_1.831_all.deb"
dpkg --install webmin_1.831_all.deb;
apt-get -y -f install;
rm /root/webmin_1.831_all.deb
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart
service vnstat restart

# text gambar
apt-get install boxes

# color text
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc "https://raw.githubusercontent.com/cucuatok93/cucunenek/master/.bashrc"

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat

# install pptp vpn
wget $source/pptp.sh
chmod +x pptp.sh
./pptp.sh

# install ssl
apt-get update
apt-get upgrade
apt-get install stunnel4
wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/cucuatok93/cucunenek/master/stunnel.conf"
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#menu
wget -O /etc/motd $source/motd
wget -O /etc/issue.net $source/banner
wget -O /usr/bin/menu $source/menu.sh
wget -O /usr/bin/user-add $source/user-add.sh
wget -O /usr/bin/user-renew $source/user-renew.sh
wget -O /usr/bin/user-pass $source/user-pass.sh
wget -O /usr/bin/user-del $source/user-del.sh
wget -O /usr/bin/user-list $source/user-list.sh
wget -O /usr/bin/user-expire $source/user-expire.sh
wget -O /usr/bin/user-gen $source/user-gen.sh
wget -O /usr/bin/user-add-pptp $source/user-add-pptp.sh
wget -O /usr/bin/dropmon $source/dropmon.sh
wget -O /usr/bin/user-login $source/user-login.sh
wget -O /usr/bin/user-limit $source/user-limit.sh
wget -O /usr/bin/ps-mem $source/ps_mem.py
wget -O /usr/bin/speedtest $source/speedtest_cli.py
wget -O /usr/bin/benchmark $source/benchmark.sh

chmod +x /usr/bin/menu
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-del
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-expire
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/ps-mem
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/benchmark
echo "0 0 * * * root /usr/bin/user-expire" > /etc/cron.d/user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "* * * * * service dropbear restart" > /etc/cron.d/dropbear


echo "UPDATE AND INSTALL COMPLETE COMPLETE 99% BE PATIENT"
rm $0
rm *.sh
rm ps_mem.py
rm speedtest_cli.py
clear
service openvpn restart
service squid3 restart
service ssh restart
service webmin restart
service dropbear restart
service nginx start
cd
red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'

               echo -e "\e[38;5;82m KAMI TENGAH BUAT KIRAAN VPS ANDA..."
			   sleep 1

			   echo -e "\e[38;5;11m DALAM KIRAAN 3...."
               sleep 2
                          echo -e "\e[38;5;13m DALAM KIRAAN 2"
		sleep 2.5	  
			   echo -e "\e[38;5;226m DALAM KIRAAN 1..."
               sleep 1.5
               
			   echo -e "${green}SUDAH BERJAYA...${NC}"
               sleep 1
cd
clear
echo ""  | tee -a log-install.txt
echo "========================================"  | lolcat
echo "Service Autoscript Created By Cucu Atok "  | lolcat
echo "----------------------------------------"  | lolcat
echo "Website : http://Cucuatok.pe.hu."  | tee -a log-install.txt | lolcat
echo "   Contact Number     : +60175835809     "  | tee -a log-install.txt | lolcat
echo ""  | tee -a log-install.txt
echo "Download client at http://$myip/client.ovpn"  | tee -a log-install.txt | lolcat
echo "Webmin     : http://$myip:10000/" | lolcat
echo "Squid3     : 80, 8000, 8080, 3128"  | tee -a log-install.txt | lolcat
echo "OpenSSH    : 22, 143"  | tee -a log-install.txt | lolcat
echo "Dropbear   : 109, 110, 443"  | tee -a log-install.txt | lolcat
echo "Timezone   : Asia/Kuala_Lumpur"  | tee -a log-install.txt | lolcat
echo "Fail2Ban   : [on]"   | tee -a log-install.txt | lolcat | lolcat
echo "Anti Doss  : [on]"   | tee -a log-install.txt | lolcat
echo "VPS Restart: 12.00am"   | tee -a log-install.txt | lolcat
echo ""  | tee -a log-install.txt | lolcat
echo "----------------------------------------" | lolcat
echo "------Thank you for choice us--------"
echo "==========================================="  | tee -a log-install.txt
echo "      PLEASE REBOOT TAKE EFFECT TERIMA KASIH!"
echo "==========================================="  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
