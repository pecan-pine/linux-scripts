#!/bin/bash

# unmounts all drives in a standard list or in a given list

echo "ua:--the unmount-all script--"

if [[ $# = 0 ]]
then
	# drives=(sda2 sda5 sdb1 sdb2 sdb4 sdb6)    
	drives=( sda1 sda2 sda3 sdb2 sdb5 )
#excluding sda1 since this is expected to run on sda1
#excluding sda4 since that is shared files drive
#excluding sdb3 and sdb5 since those are storage also
else
	drives=( $@ )
fi

echo "Preparing to unmount the following locations:"
for drive in "${drives[@]}"
do
    echo "/mnt/$drive"
done

while true; do
	read -p "Is this ok? [y/n]: " yn
	case $yn in
		[Yy]*) echo "Proceeding to unmount drives"; break ;;
		[Nn]*) echo "Aborted"; exit 1 ;;
	esac
done

for drive in "${drives[@]}"
do
    sudo umount /mnt/$drive
done

echo "done"



