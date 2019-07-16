#!/bin/bash

set -e
set -x

modprobe overlay
modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat > /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sysctl --system

# Install prerequisites
sudo apt-get update
sudo apt-get install -y software-properties-common

sudo add-apt-repository ppa:projectatomic/ppa
sudo apt-get update

# Install CRI-O
sudo apt-get install -y cri-o-1.13
