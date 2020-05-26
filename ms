#!/bin/bash

# makes an executable bash file in current directory
if [ $# -eq 0 ]
then
	echo "ms:--the make script script--"
	echo "USAGE: ms <filename>"
	exit 1
elif [[ $(ls | grep $1) == $1 ]]
then
	echo "There is already a file with this name"
	exit 2
else
	filename=$1
fi

echo "Preparing to create and open executable file $filename in current directory:"
echo " " $PWD
while true; do
	read -p "Is this ok? [y/n]: " yn
	case $yn in
		[Yy]*) echo "Creating file $filename..."; break ;;
		[Nn]*) echo "Aborted"; exit 1 ;;
	esac
done

touch $filename
echo '#!/bin/bash' > $filename
chmod +x ./$filename
(gedit $filename &)

echo "done"



