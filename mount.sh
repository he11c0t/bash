#!/bin/bash
read -p  "Введите Имя Пользователя:" domuser
read -s -p "Введите Пароль:" pass
mkdir /home/$domuser@domen /H M K N W
sudo mount.cifs //disk path /home/$domuser@domen/H cifs ver="2.1" -o username="$domuser",password="$pass"
sudo mount.cifs //disk path /common /home/$domuser@domen/M cifs ver="2.1" -o username="$domuser",password="$pass"
sudo mount.cifs //disk path /home/$domuser@domen/K cifs ver="2.1" -o username="$domuser",password="$pass"
sudo mount.cifs //disk path /home/$domuser@domen/N cifs ver="2.1" -o username="$domuser",password="$pass"
sudo mount.cifs //disk path /home/$domuser@domen/W cifs ver="2.1" -o username="$domuser",password="$pass"


