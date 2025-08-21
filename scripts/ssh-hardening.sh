#!/bin/bash

# Script: harden_ssh.sh
# Purpose: Harden SSH configuration for security
# Usage: Run as root or with sudo

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo." >&2
    exit 1
fi

# Backup the original sshd_config
echo "Backing up /etc/ssh/sshd_config..."
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Disable password authentication
echo "Disabling password authentication..."
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

# Disable root login
echo "Disabling root login..."
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
echo "Restarting SSH service..."
systemctl restart sshd

# Verify changes
echo "Verifying SSH configuration..."
grep -E "PasswordAuthentication|PermitRootLogin" /etc/ssh/sshd_config

echo "SSH hardening completed successfully!"
# Exit with success status
exit 0