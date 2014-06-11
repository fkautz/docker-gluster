IPADDR=$(/sbin/ifconfig eth0 |grep -i "net addr" |  awk '{print $2}' | sed 's/.*://g')

glusterd -N &

if [ ! -d "$DIRECTORY" ]; then
  gluster volume create vault $IPADDR:/mnt/vault force
fi

gluster volume start vault

wait
