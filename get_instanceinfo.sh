#!/bin/bash
local_hostname=$(curl -s "http://169.254.169.254/latest/meta-data/local-hostname")
local_ipv4=$(curl -s "http://169.254.169.254/latest/meta-data/local-ipv4")
mac_addr=$(curl -s "http://169.254.169.254/latest/meta-data/network/interfaces/macs/")
mac_addr=${mac_addr%/}
subnet_id=$(curl -s "http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mac_addr/subnet-id")
public_ipv4=$(curl -s "http://169.254.169.254/latest/meta-data/public-ipv4")
security_groups=$(curl -s "http://169.254.169.254/latest/meta-data/security-groups")
instance_id=$(curl -s "http://169.254.169.254/latest/meta-data/instance-id")
instance_type=$(curl -s "http://169.254.169.254/latest/meta-data/instance-type")
availability_zone=$(curl -s "http://169.254.169.254/latest/meta-data/placement/availability-zone")
os_info=$(cat /etc/os-release | grep -E '^NAME=|^VERSION=')
os_info=${os_info//NAME=/}
os_info=${os_info//VERSION=/}

echo
echo "Local hostname: "$local_hostname""
echo  
echo "Local IPv4 address: "$local_ipv4""
echo 
echo "MAC address: "$mac_addr""
echo
echo "Subnet ID: "$subnet_id""
echo
echo "Public IPv4 address: "$public_ipv4""
echo
echo "Security group(s): "$security_groups""
echo 
echo "Instance ID: "$instance_id""
echo
echo "Instance type: "$instance_type""
echo 
echo "Availability zone: "$availability_zone""
echo
echo "OS info: "$os_info""
echo
