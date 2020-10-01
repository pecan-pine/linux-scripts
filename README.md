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

The "binary compare script". A shortcut script for "dcmp ~/linux-scripts ~/.local/bin" to copy my linux-scripts git repository
to the local binary directory. 

## colorfunction 

A set of bash functions to make coloring text easier. For example:
```Bash
color Hello! red
```
will print `Hello!` in red. 

In most cases, I think it's easier to just look up the escape codes for a certain color than to 
require this big function just for a few colors. For using many colors, I think it is fairly useful. 

## dcmp

The "directory compare" script. A script which will compare files in a source directory to files with the same name in a target directory. dcmp uses the bash command `cmp` 
to compare files. If changes are found, it then displays the output of `diff` on the two files, and asks the user if they would like to copy the file from source to target. If no changes are found, it echo's in green that it found no changes in that file. In the end, it asks the user if they would like to update the git repository in the source directory, and optionally walks through a git add/commit/push of the repository. 

## dcmp-auto

A version of `dcmp` to be run by a script. If any new files or modifications are found in the source directory, it copies all files from source to target. If no files have been modified, it does nothing. I used this script in my continuous-resume project to copy some files to my website repository only when changes were found. 

## gpp

A script to make and run a C++ file using g++. I think this would be better as a makefile. 

## install.sh

A script to copy all (or a selected portion) of the linux-scripts to the user's ~/.local/bin folder. 

## ma

The "mount all" script. It will mount all drives in a (built-in or user-provided) list. I use this
to make it easier for grub configuration to find other operating systems on drives. 

# mpp

The "make C++ program template" script. 

# ms 

The "make script" script. It makes an executable file in the current directory with first line
```
#!/bin/bash
```
# ua

The "unmount all" script. Unmounts all drives in a stored or user-provided list. This is meant to undo the effects of `ma` after updating grub. 



