#!/bin/bash
# User input
echo -n "Enter IP for Nikto web scan [ENTER]: "
read targets_web


# nikto scan on open web servers
nikto -h $targets_web
