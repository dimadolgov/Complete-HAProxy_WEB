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
${join("\n", [for i, ip in split(",", instance_ip) : "  server web_server${i + 1} ${ip}:80 check"])}
" | sudo tee "$haproxy_config"


# Restart and enable HAProxy
sudo systemctl restart haproxy
sudo systemctl enable haproxy
