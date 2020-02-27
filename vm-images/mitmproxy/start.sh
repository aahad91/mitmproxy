#!/bin/bash

date > /tngbench_share/start.txt

mitmdump -p 3128 -I 192.168.34.0/24 -T --anticache

echo "mitmproxy VNF started"
