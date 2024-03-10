#!/bin/bash

# Use curl to fetch the public IP address from an external service
DYNAMIC_IP=$(curl -s https://api.ipify.org)

# Output the dynamic IP address
echo $DYNAMIC_IP