#!/bin/bash

# include color functions script (must be in same folder as this script)
. ./colorfunction

# script to install linux scripts into user's .local/bin folder
echo
color  "Welcome to pecan-pine's linux-script installation script!" purple
echo
echo "If you wish, this script will copy a selection of linux scripts into your .local/bin folder."
echo
echo "After copying, you can run any of the scripts by typing for example:"
echo "ms"
echo "to run the make-script script."
echo 
echo "This script will create the directory ~/.local/bin on your computer if the directory does not already exist (it will check first)."
echo
color "This script must be run from the linux-scripts directory" red -n 
echo " (although the linux-scripts directory can be located anywhere)" 
echo
color "This script is meant to be run on a " red -n 
echo -n "linux "
color "computer" red
echo

# ask for permission to proceed
while true; do
    read -p "Proceed? [Y/n]: " yn
    case $yn in 
        [Yy]*|"") echo "Proceeding..."; echo; break;;
        [Nn]*) echo "Aborting..."; exit 1;;
    esac
done

# check for existing folders, create if necessary
if [ -d ~/.local ]
then
    # .local found
    if [ -d ~/.local/bin ]
    then 
        # success! both folders already exist
        echo "~/.local/bin folder found"
    else 
        echo "~/.local folder found, but not ~/.local/bin"
        echo "creating ~/.local/bin folder..."
        mkdir ~/.local/bin
        echo "folder created"
    fi
else 
    echo "~/.local folder not found"
    echo "creating ~/.local/bin folder..."
    mkdir -p ~/.local/bin
    echo "folder created"
fi

# create list of available scripts
# and print them for the user
scripts=()

echo "Here is the list of available scripts:"
for fn in *; do
    if [ -f "$fn" ] && [ "${fn}" != "LICENSE" ] && [ "${fn}" != "README.md" ] && [ "${fn}" != "install.sh" ]
    then 
        scripts+=( "$fn" )
        echo "$fn"
    fi
done

# function to remove one particular script from the array
# usage remove_from_scripts <script>
function remove_from_scripts {
    helper_array=()
    for script in "${scripts[@]}"; do
        if [ "${script}" == "${1}" ]
        then
            :
        else
            helper_array+=( "$script" )
        fi
    done
    scripts=("${helper_array[@]}")
    unset helper_array
}

# function to go through all scripts and remove if desired
# usage: remove_scripts
function remove_scripts {
    # select scripts from list
    for script in "${scripts[@]}"; do
        while true; do
            read -p "Include script $script? [Y/n]: " selection
            case $selection in 
                [Yy]*|"") break;;
                [Nn]*) echo "Removing script $script..."; remove_from_scripts "${script}"; break;;
            esac
        done
    done
    # print the selected scripts
    echo "You have selected the following scripts:"
    for script in "${scripts[@]}"; do
        echo "${script}"
    done
    # ask for comfirmation or exit
    while true; do
        read -p "Is that ok, or would you like to exit the program? [Y/n]: " selection
        case $selection in 
            [Yy]*|"") echo "Proceeding..."; break;;
            [Nn]*) echo "Aborting..."; exit 2;;
        esac
    done
}

# give the option to only copy some scripts
while true; do
    read -p "Would you like to copy all of the scripts? [Y/n]: " yn
    case $yn in
        [Yy]*|"") echo "Preparing to copy all scripts..."; break;;
        [Nn]*) echo "Please select the scripts you would like"; remove_scripts; echo "Preparing to copy scripts..."; break;;
    esac
done

for script in "${scripts[@]}"; do
    cp "$script" ~/.local/bin
done

echo "Installation complete"
echo
echo "You may need to re-start bash for changes to take place."
echo
echo "If commands are still not found after re-starting, you may need to add ~/.local/bin to your PATH, either via ~/.profile or otherwise."
echo 
echo "done"

