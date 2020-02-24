#!/bin/bash
apt-get update;
echo "apt update"
sleep 1
apt-get install -y net-tools iproute2 inetutils-ping iptables python python-yaml python3 python3-pip;
sleep 1
echo "package installed"
python3 -m pip install --user pipx
python3 -m pipx ensurepath
sleep 1
echo "installed pipx"
pipx install mitmproxy
echo "mitmproxy installed"
