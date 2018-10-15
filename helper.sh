#!/bin/bash
clear

#printing info
sleep 1
echo  Checking root privileges...
sleep 1

#checking root privileges
if [[ $UID == 0 ]]; then
	echo "Please run this script WITHOUT sudo !"
	echo "$0 $*"
	exit 1
fi

#updating pacman database
sleep 1
echo Updating pacman database...
sleep 1
sudo pacman -Syyu

#checking for orphans package
clear

sleep 1
echo Checking for orphans package...
sleep 1
orphans=$(sudo pacman -Qdt)
if [ -z "$orphans" ]
then
	sleep 1
	echo No oprhan package found !
	sleep 1
else
	sleep 1
	echo  Removing orphan package...
	sleep 1
	sudo pacman -Rsn $(sudo pacman -Qdtq)
fi

#updating aur database
clear

sleep 1
echo "Updating AUR repo database..."
sleep 1
aurman -Syyu

#printing finish info
clear

echo "============================="
echo "==                         =="
echo "== SUCCESSFULLY TERMINATED =="
echo "==                         =="
echo "============================="
