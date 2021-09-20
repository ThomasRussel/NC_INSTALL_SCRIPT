#! /bin/sh

echo "Hallo, $USER. Welkom bij de installatie van je eigen Linux webserver!"
read -r -p "Wil je alles installeren? [Y]: " installeer
echo $installeer

if [ "$installeer" = "Y" ]; then

	# Apache installatie:

	sudo zypper refresh
	sudo zypper update
	sudo zypper install apache2
	sudo systemctl start apache2
	sudo systemctl enable apache2

	# MariaDB installatie:

	sudo zypper install mariadb mariadb-client mariadb-tools
	sudo systemctl start mariadb.service
	sudo systemctl enable mariadb.service
	systemctl status mariadb

	# PHP7 installatie:

	sudo zypper install php7 php7-mysql apache2-mod_php7
	sudo a2enmod php7
	sudo systemctl restart apache2

	#Nextcloud installatie:

	zypper install nextcloud
	create database nextcloud;
	create user nextclouduser@localhost identified by '1234';
	grant all privileges on nextcloud.* to nextclouduser@localhost identified by '1234'

	#fail2ban installatie:
	sudo zipper install fail2ban

	#OpenSSL configuratie:

	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US' -nodes

	#firewall installatie:

	sudo zypper install firewalld
	sudo systemctl enable firewalld
	sudo systemctl start firewalld
	sudo systemctl status firewalld
	#Stop het programma
	
	exit;

fi
while true 
do 
	read -r -p "Typ wat je wil installeren: " programma
	case $programma in

	  "webserver")
		sudo zypper refresh
		sudo zypiper update
		sudo zypper install apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		sudo zypper install mariadb mariadb-client mariadb-tools
		sudo systemctl start mariadb.service
		sudo systemctl enable mariadb.service
		systemctl status mariadb
		sudo zypper install php7 php7-mysql apache2-mod_php7
		sudo a2enmod php7
		sudo systemctl restart apache2
		break
	     ;;

	  "nextcloud") 
		zypper install nextcloud
		create database nextcloud;
		create user nextclouduser@localhost identified by '1234';
		grant all privileges on nextcloud.* to nextclouduser@localhost identified by '1234'
		break
	     ;;

	  "fail2ban")
		sudo zipper install fail2ban
		break
	    ;;

	  "HTTPS")
		openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US' -nodes
		break
	    ;;

	  "firewall")
		sudo zypper install firewalld
		sudo systemctl enable firewalld
		sudo systemctl start firewalld
		sudo systemctl status firewalld
		break
	    ;;

	  *)
	    echo "commando niet herkend"
	    ;;
	esac
done
echo "het script sluit nu af"
