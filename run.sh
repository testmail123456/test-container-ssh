#!/bin/bash

echo "Starting Dropbear SSH on port 8000..."

# Generate host key if it doesn't exist
if [ ! -f /etc/dropbear/dropbear_rsa_host_key ]; then
    ./dropbear -r /etc/dropbear/dropbear_rsa_host_key -F -E -p 8000 &
fi

# Start Dropbear in foreground
./dropbear -E -F -p 8000 -r /etc/dropbear/dropbear_rsa_host_key
