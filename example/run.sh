#!/bin/bash

echo "Starting Dropbear SSH on port 8000..."

# Start Dropbear in foreground
/usr/local/bin/dropbear -E -B -F -p 8000 -R