#!/bin/bash

echo "Starting Dropbear SSH on port 8000..."

# Generate host key if it doesn't exist
if [ ! -f /etc/dropbear/dropbear_rsa_host_key ]; then
    echo "Host key not found, generating..."
    /usr/local/bin/ -R -f /etc/dropbear/dropbear_rsa_host_key
fi

# Start Dropbear in foreground
/usr/local/bin/ -E -F -p 8000 -r /etc/dropbear/dropbear_rsa_host_key
