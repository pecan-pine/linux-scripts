#!/bin/bash

# mount all drives (or all drives in list)
# used mostly to make grub configuration easier

echo "ma--the mount all script--"

if [[ $# = 0 ]]
then
	drives=(sda2 sda5 sdb1 sdb2 sdb4 sdb6) 
#excluding sda1 since this is expected to run on sda1
#excluding sda4 since that is shared files drive
#excluding sdb3 and sdb5 since those are storage also
else
	drives=$@
fi

echo "Preparing to mount the following locations:"
for drive in ${drives[@]}
do
    echo "/mnt/$drive"
done

while true; do
	read -p "Is this ok? [y/n]: " yn
	case $yn in
		[Yy]*) echo "Proceeding to mount drives"; break ;;
		[Nn]*) echo "Aborted"; exit 1 ;;
	esac
done

for drive in "${drives[@]}"
do
    sudo mount /dev/$drive /mnt/$drive
done

echo "done"


while true; do
	read -p "Would you like to configure grub? [y/n]: " yn
	case $yn in
		[Yy]*) echo "Configuring grub at /boot/grub/grub.cfg..."; break ;;
		[Nn]*) echo "Grub configuration cancelled"; exit 1 ;;
	esac
done
#echo "to configure grub, type 'grub-mkconfig -o /boot/grub/grub.cfg'"
sudo grub-mkconfig -o /boot/grub/grub.cfg

