#!/bin/bash
if (whiptail --title "Прокси" --yesno "Включить прокси для терминала ?" --yes-button="Да" --no-button="Нет" 10 60) then 
echo https_proxy=\"https://ip:port/\" >> /etc/environment 
echo http_proxy=\"http://ip:port/\" >> /etc/environment 
echo ftp_proxy=\"ftp://ip:port/\" >> /etc/environment
	else
sed -i "2,6d" /etc/environment
fi	
