#!/bin/bash

date > /tngbench_share/start.txt

while true;
do
 case "$1"
 in
 mp.input) shift;INPUT=$1;;
 mp.output) shift;OUTPUT=$1;;
 vnf) shift;VNF=$1;;
 esac
 shift;
 if [ "$1" = "" ]; then
  break
 fi
done

mitmproxy --set allow_hosts:[$INPUT] anticache:[True]

echo "mitmproxy VNF started"
