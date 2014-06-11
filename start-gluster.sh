# Make sure rpcbind is started - GlusterNFS would complain
## RPC bind service will complain about Locale files but ignore
service rpcbind start

## On docker surprisingly hostnames are mapped to IP's :-)
IPADDR=$(hostname -i)

## Start Gluster Management Daemon
serivce glusterd start

if [ ! -d "$DIRECTORY" ]; then
  ## Always create a sub-directory inside a mount-point
  gluster volume create myvolume $IPADDR:/mnt/vault/myvolume
fi

gluster volume start myvolume
