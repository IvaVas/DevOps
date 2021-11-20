#!/bin/bash
user_name=$1
directory_name=$2
if [[ $user_name = "" && $directory_name = "" ]]; then
    echo "Enter new owner and directory"
elif id "$user_name" &>/dev/null && [ -d "$directory_name" ]; then
    sudo chown -R $user_name:$user_name $directory_name
    echo "$user_name is the new owner of the directory \""$directory_name"\" "
else
    echo "You entered incorrect data "
fi

