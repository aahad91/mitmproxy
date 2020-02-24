#!/bin/bash

# Set of packages and commands to build squid image
#Step1:
#sudo apt update
#sudo apt-get -y install libguestfs-tools
#export LIBGUESTFS_BACKEND=direct

#Step2:
wget http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img

#Step3:
#install packages, copy files
# syntax: virt-customize -a [DOWNLOADED_FILE_NAME] --install [LIST_OF_PACKAGES]
#         virt-customize -a [DOWNLOADED_FILE_NAME] --run-command 'apt-get update'
#         virt-customize -a [DOWNLOADED_FILE_NAME] --mkdir [folder_name]
#         virt-customize -a [DOWNLOADED_FILE_NAME] --upload [src-file:dest-file]
#Run with sudo
virt-customize -a xenial-server-cloudimg-amd64-disk1.img \
      --run-command 'echo "manage_etc_hosts: true" >> /etc/cloud/cloud.cfg' \
      --mkdir /tngbench_share \
      --upload log_intf_statistics.py:/log_intf_statistics.py \
      --upload start.sh:/start.sh \
      --upload stop.sh:/stop.sh \
      --run-command 'chmod +x start.sh' \
      --run-command 'chmod +x stop.sh' \
      --upload install.sh:/install.sh \
      --run install.sh \



# OpenStack command to add squid image
#source /opt/stack/devstack/accrc/admin/admin
#openstack image create --public --disk-format qcow2 --container-format bare --file xenial-server-cloudimg-amd64-disk1.img mitmproxy-vm
