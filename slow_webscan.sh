#!/bin/bash

# User input
echo -n "Enter IPs to scan [ENTER]: "
read targets
#echo -n "Enter time in sec between fases [ENTER]: "
#read interval_time

# Validation user input
echo
echo "Selected IPs are: $targets"
#echo "Selected interval time is: $interval_time"

# Start ping-only nmap
echo
nmap -n -sn $targets
#sleep $interval_time
sleep 900

# Explain time sleeping
#echo
#echo "Slept for $interval_time seconds"

# User input
echo -n "Enter IPs for port scan [ENTER]: "
read targets_port

# Port scan devices
echo
nmap -n $targets_port
#sleep $interval_time
sleep 900

# Explain time sleeping
#echo
#echo "Slept for $interval_time seconds"

# User input
echo -n "Enter IP for Nikto web scan [ENTER]: "
read targets_web


# nikto scan on open web servers
nikto -h $targets_web
