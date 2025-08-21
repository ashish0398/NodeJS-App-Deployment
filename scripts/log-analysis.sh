#!/bin/bash

# Script: log-analysis.sh
# Purpose: Parse log files for errors and check disk usage
# Usage: ./analysis.sh <log_file_path> <disk_usage_threshold_in_percent>

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <log_file_path> <disk_usage_threshold_in_percent>"
    exit 1
fi

LOG_FILE="$1"
THRESHOLD="$2"

# Function to parse log file for errors
parse_logs() {
    echo "=== Log Analysis ==="
    if [ ! -f "$LOG_FILE" ]; then
        echo "Error: Log file '$LOG_FILE' not found."
        exit 1
    fi
    ERROR_COUNT=$(grep -i "error" "$LOG_FILE" | wc -l)
    echo "Total errors found: $ERROR_COUNT"
}

# Function to check disk usage
check_disk_usage() {
    echo -e "\n=== Disk Usage Analysis ==="
    USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo "Warning: Disk usage is ${USAGE}%, which exceeds the threshold of ${THRESHOLD}%!"
    else
        echo "Disk usage is ${USAGE}%, which is within the threshold."
    fi
}

# Execute functions
parse_logs
check_disk_usage
