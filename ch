#!/bin/bash  

# chroot into drive, mounting at mount point name
drive=$1
name=$2

if [[ $drive == '' || $name == '' ]]
then
	echo "ch--the change root script--"
	echo "USAGE: ch [drive] [name (of mount point)]"
	exit 1
fi
while true; do
	read -p "Do you want to mount and chroot drive '/dev/$drive' at mount point '/mnt/$name'? [y/n]: " yn
	case $yn in
		[Yy]*) echo "Proceeding to mount drive"; break ;;
		[Nn]*) echo "Aborted"; exit 1 ;;
	esac
done

echo "Mounting drive /dev/$drive into /mnt/$name..."
sudo mount /dev/$drive /mnt/$name
#sudo mount /dev/sda2 /mnt/gentoo/boot
#swapon /dev/sda3
echo "Mounting proc, sys, dev..."
sudo mount -t proc proc /mnt/$name/proc
sudo mount --rbind /sys /mnt/$name/sys
sudo mount --make-rslave /mnt/$name/sys
sudo mount --rbind /dev /mnt/$name/dev
sudo mount --make-rslave /mnt/$name/dev
echo "chrooting into $name..."
echo "enter 'exit' to exit"
echo "be sure to run 'source /etc/profile'"
echo "be sure to run 'bash chu $name' afterwards"
sudo chroot /mnt/$name /bin/bash

