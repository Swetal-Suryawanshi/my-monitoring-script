#!/bin/bash

# Function to monitor Top 10 Most Used Applications
top_apps() {
    echo "Top 10 Most CPU Consuming Applications:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -11
    echo "Top 10 Most Memory Consuming Applications:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -11
}

# Function to monitor Network Usage
network_monitor() {
    echo "Network Monitoring:"
    echo "Number of concurrent connections:"
    netstat -an | grep ESTABLISHED | wc -l
    echo "Packet Drops:"
    netstat -s | grep 'packet receive errors'
    echo "Network Traffic (in MB):"
    ifstat -t 1 1
}

# Function to monitor Disk Usage
disk_usage() {
    echo "Disk Usage:"
    df -h | awk '{if($5 > 80) print $0}'
}

# Function to monitor System Load
system_load() {
    echo "System Load:"
    uptime
    echo "CPU Usage Breakdown:"
    mpstat | grep all
}

# Function to monitor Memory Usage
memory_usage() {
    echo "Memory Usage:"
    free -h
    echo "Swap Usage:"
    free -h | grep Swap
}

# Function to monitor Processes
process_monitor() {
    echo "Active Processes:"
    ps aux | wc -l
    echo "Top 5 Processes by CPU:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
    echo "Top 5 Processes by Memory:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
}

# Function to monitor essential services
service_monitor() {
    echo "Service Monitoring:"
    for service in sshd nginx apache2 iptables; do
        systemctl is-active --quiet $service && echo "$service is running" || echo "$service is NOT running"
    done
}

# Check command-line arguments for specific monitoring
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -cpu)
    top_apps
    ;;
    -network)
    network_monitor
    ;;
    -disk)
    disk_usage
    ;;
    -load)
    system_load
    ;;
    -memory)
    memory_usage
    ;;
    -process)
    process_monitor
    ;;
    -service)
    service_monitor
    ;;
    *)
    echo "Invalid option!"
    ;;
esac
shift
done

# Refresh the data every few seconds if no arguments are provided
if [[ $# -eq 0 ]]; then
    while true
    do
        clear
        top_apps
        network_monitor
        disk_usage
        system_load
        memory_usage
        process_monitor
        service_monitor
        sleep 5
    done
fi
