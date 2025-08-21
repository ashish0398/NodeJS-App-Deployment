#!/bin/bash

# Script: debug_web_service.sh
# Purpose: Diagnose and attempt to fix a web service (Apache/Nginx) not starting on EC2
# Usage: Run as root or with sudo. Specify the service name (apache2 or nginx) as an argument.

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo." >&2
    exit 1
fi

# Check if service name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <service_name>"
    echo "Example: $0 apache2"
    exit 1
fi

SERVICE="$1"

# Function to check service status
check_status() {
    echo "=== Checking $SERVICE status ==="
    systemctl status "$SERVICE" --no-pager
}

# Function to check journal logs
check_logs() {
    echo -e "\n=== Checking $SERVICE logs ==="
    journalctl -u "$SERVICE" -xe --no-pager | tail -n 20
}

# Function to test configuration
test_config() {
    echo -e "\n=== Testing $SERVICE configuration ==="
    if [ "$SERVICE" = "apache2" ]; then
        apache2ctl configtest
    elif [ "$SERVICE" = "nginx" ]; then
        nginx -t
    else
        echo "Unsupported service. Use 'apache2' or 'nginx'."
        exit 1
    fi
}

# Function to check port availability
check_port() {
    echo -e "\n=== Checking port availability ==="
    if [ "$SERVICE" = "apache2" ]; then
        PORT=80
    elif [ "$SERVICE" = "nginx" ]; then
        PORT=80
    fi
    netstat -tulnp | grep ":$PORT"
}

# Function to restart service
restart_service() {
    echo -e "\n=== Restarting $SERVICE ==="
    systemctl restart "$SERVICE"
    systemctl status "$SERVICE" --no-pager
}

# Main script logic
check_status
check_logs
test_config
check_port
restart_service
# Final status check
echo -e "\n=== Final $SERVICE status ==="
check_status