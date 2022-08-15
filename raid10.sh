!#/bin/bash

sudo mdadm --zero-superblock --force /dev/sd[bcde]
sudo mdadm --create --verbose /dev/md/raid_10 --level=10 --raid-devices=4 /dev/sd[bcde]
sudo mkdir /etc/mdadm
sudo touch /etc/mdadm/mdadm.conf
sudo echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
sudo mdadm --detail --scan --verbose | awk '/ARRAY/ {print}'' >> /etc/mdadm/mdadm.conf