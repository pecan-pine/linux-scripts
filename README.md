# linux-scripts
Various linux scripts--drive mounting and unmounting, configuring grub, changing file permissions, etc.

## ask

A script that acts as a function which will ask the user a yes or no question, then perform one of two 
actions, depending on the answer. I am not currently using this script, since using it for complicated
actions is not very readable. I think it would be better as a more specific function, perhaps. 

## backup-home

A script that will make a backup of my home directory (or any other directory). The script makes a 
copy of the directory, writes a note in a log file, and deletes old backups. 

## bcmp

A shortcut script for "dcmp ~/linux-scripts ~/.local/bin" to copy my linux-scripts git repository
to the local binary directory. 

