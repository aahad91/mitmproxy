#!/bin/bash

date > /tngbench_share/start.txt

mitmproxy --allow_hosts --anticache

echo "mitmproxy VNF started"
