#!/bin/bash
len=$#
for_counter=$(($len - 1))  # The last argument is the destination folder
destination="${!len}"    # Get the value of the last argument
hostname=$(hostname)
files_size=0

if [ "$hostname" = "server1" ]; then
        other_server="server2"
fi

if [ "$hostname" = "server2" ]; then
        other_server="server1"
fi

#echo "Other server is: $other_server"
#echo "Hostname: $hostname"
#echo "Number of arguments: $len"
#echo "For counter: $for_counter"
#echo "Destination: $destination"

if [ $len -lt 2 ]; then
    #initial_size=$(ssh vagrant@$other_server "du -sb /tmp | tr -dc '0-9'")
    scp -r /home/ubuntu/.profile vagrant@$other_server:/tmp
    scp -r /home/ubuntu/.bash_logout vagrant@$other_server:/tmp
    #final_size=$(ssh vagrant@$other_server "du -sb /tmp | tr -dc '0-9'")
    #copied_size=$((final_size - initial_size))
    #echo $copied_size
    size_1=$(ssh vagrant@$other_server "du -sb /tmp/.profile | tr -dc '0-9'")
    size_2=$(ssh vagrant@$other_server "du -sb /tmp/.bash_logout | tr -dc '0-9'")
    files_size=$((size_1 + size_2))
    echo $files_size
fi

if [ $len -gt 1 ]; then
    #initial_size=$(ssh vagrant@$other_server "du -sb $destination | tr -dc '0-9'")
    for ((i = 1; i < len; i++)); do
        scp -r "${!i}" "vagrant@$other_server:$destination"
	file_name=$(basename "${!i}")
	#echo "$file_name"
	current_dest="$destination""$file_name"	
	current_size=$(ssh vagrant@$other_server "du -sb $current_dest | tr -dc '0-9'")
	#echo $current_dest
	#echo $current_size
	files_size=$((files_size + current_size))
    done
    echo $files_size
    #final_size=$(ssh vagrant@$other_server "du -sb $destination | tr -dc '0-9'")
    #copied_size=$((final_size - initial_size))
    #echo $copied_size

fi
