# my-monitoring-script
# System Monitoring Script

This Bash script monitors various system resources and presents them in a dashboard format. It provides real-time insights and can be customized to display specific parts of the dashboard.

## Features

- **Top 10 Most Used Applications:** Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring:** Shows the number of concurrent connections, packet drops, and network traffic.
- **Disk Usage:** Provides disk space usage by mounted partitions and highlights partitions using more than 80% of the space.
- **System Load:** Displays the current load average and CPU usage breakdown.
- **Memory Usage:** Shows total, used, free memory, and swap usage.
- **Process Monitoring:** Lists the number of active processes and the top 5 processes by CPU and memory usage.
- **Service Monitoring:** Checks the status of essential services like `sshd`, `nginx`, `apache2`, and `iptables`.

## Usage

To run the script and view all metrics with automatic refresh:

```bash
./monitor.sh
To view specific metrics, use the following command-line switches:

CPU Usage: ./monitor.sh -cpu
Network Monitoring: ./monitor.sh -network
Disk Usage: ./monitor.sh -disk
System Load: ./monitor.sh -load
Memory Usage: ./monitor.sh -memory
Process Monitoring: ./monitor.sh -process
Service Monitoring: ./monitor.sh -service

Requirements
Ensure the following tools are installed:

ifstat
mpstat
net-tools (for netstat)

Install these tools with:

sudo apt update
sudo apt install ifstat sysstat net-tools
