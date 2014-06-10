IPADDR = /sbin/ifconfig eth0 |grep -i "net addr" |  awk '{print $2}' | sed 's/.*://g'

glusterfsd

gluster volume create vault /mnt/vault force

gluster volume start vault
