#!/bin/bash

# Fetch the public IP address
pub_ip=$(curl -s ifconfig.me)

# Output the public IP address
echo "$pub_ip"
