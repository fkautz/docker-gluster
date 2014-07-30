# Make sure rpcbind is started - GlusterNFS would complain
## RPC bind service will complain about Locale files but ignore
service rpcbind start

## On docker surprisingly hostnames are mapped to IP's :-)
IPADDR=$(hostname -i)

## Change this to your name if necessary
VOLUME=myvolume

## Start Gluster Management Daemon
service glusterd start

if [ -z $VOLUME ]; then
  ## Check if volume is null
  service glusterd stop
  exit 255
fi

if [ ! -d "/var/lib/glusterd/vols/$VOLUME" ]; then
  ## Always create a sub-directory inside a mount-point
  gluster --mode=script --wignore volume create $VOLUME $IPADDR:/mnt/vault/$VOLUME
fi

gluster --mode=script --wignore volume start $VOLUME force

shutdown_gluster()
{
  service glusterd stop
  exit $?
}

trap shutdown_gluster SIGINT
while true; do sleep 1; done
