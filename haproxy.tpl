#!/bin/bash

sudo su -
sudo yum update -y
dnf install haproxy -y

# Create HAProxy configuration file
haproxy_config="/etc/haproxy/haproxy.cfg"
echo "
frontend myfrontend
  mode http
  bind :80
  default_backend web_servers
backend web_servers 
  mode http
  balance roundrobin
" | sudo tee "$haproxy_config"

# Assuming you have executed the terraform apply and have the terraform outputs
instance_ips=${instance_ip}

# Splitting the comma-separated values into arrays
IFS=',' read -ra instance_ips <<< "$instance_ips"

# Add server lines for each instance IP
for ip in ${instance_ips}; do
    echo "server web $ip:80 check" | sudo tee -a "$haproxy_config"
done

# Restart and enable HAProxy
sudo systemctl restart haproxy
sudo systemctl enable haproxy
