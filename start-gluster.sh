# Make sure rpcbind is started - GlusterNFS would complain
## RPC bind service will complain about Locale files but ignore
service rpcbind start

## On docker surprisingly hostnames are mapped to IP's :-)
IPADDR=$(hostname -i)

## Start Gluster Management Daemon
service glusterd start

if [ ! -d "/mnt/vault/myvolume/.glusterfs" ]; then
  ## Always create a sub-directory inside a mount-point
  gluster volume create myvolume $IPADDR:/mnt/vault/myvolume
fi

gluster volume start myvolume

shutdown_gluster()
{
  service glusterd stop
  exit $?
}

trap shutdown_gluster SIGINT
while true; do sleep 1; done
