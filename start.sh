#!/bin/bash
#knxd -e 1.1.128 -E 1.1.129:8 -T -R -S -i --listen-local=/tmp/knx --error=0 -b tpuarttcp:10.0.0.200:50504
#knxd --eibaddr=1.0.255 --client-addrs=1.0.250:4 -D -R -S  -b $KNX_PORT

SLEEP_TIME_SET=${SLEEP_TIME:=1}
KNXD_OPTS_SET=${KNXD_OPTS}:="-e 1.0.255 -E 1.0.250:4 -f9 -t1023 -D -T -R -S -i -b $KNX_PORT"}
knxd $KNXD_OPTS_SET
echo "KNX Process stopped. Stopping..."
sleep $SLEEP_TIME_SET
