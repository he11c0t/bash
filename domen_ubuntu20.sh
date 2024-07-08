#!/bin/bash
if (whiptail --title "Имя хоста" --yesno "Сменил имя хоста?" --yes-button="Да" --no-button="Нет" 10 60) then 
#Прокси
echo https_proxy=\"https://ip:port/\" >> /etc/environment 
echo http_proxy=\"http://ip:port/\" >> /etc/environment 
echo ftp_proxy=\"ftp://ip:port/\" >> /etc/environment
#Обновления
sudo apt update
sudo apt upgrade 
#ssh , wmtools
sudo apt install openssh-server
#sudo apt -y install open-vm-tools-desktop 
#Установка realmd, required-package
sudo apt install realmd 
sudo apt install sssd-tools sssd libpam-sss adcli samba-common-bin
#Ввод в домен
read -p "Введите Имя Пользователя:" domuser
realm join -v DOMAIN -U $domuser
#Редактирование sssd.conf,common-session
echo "ad_gpo_access_control = permissive" >> /etc/sssd/sssd.conf
sed -i "s/use_fully_qualified_names = True/use_fully_qualified_names = False/" /etc/sssd/sssd.conf
sudo service sssd restart 
echo "session required pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /etc/pam.d/common-session
#Установка krb5
sudo apt install krb5-user 
#Редактирование krb5.conf
sed -i "/roxiable = true/a \\\tallow_weak_crypto = true" /etc/krb5.conf
sed -i "/allow_weak_crypto = true/a \\\trdns = false" /etc/krb5.conf
#sudo для учёток 
sed -i "/%admin ALL=(ALL) ALL/a %Domain\\\ Users ALL=(ALL) ALL" /etc/sudoers
	else
echo | whiptail --title "INFO" --msgbox "Смени имя и перезагрузи систему" 10 70 
fi	
