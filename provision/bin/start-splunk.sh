#!/usr/bin/env bash

status=`sudo ${SPLUNK_BIN} status`

echo "Splunk status is: $status"

# maybe status command can emit status codes instead...
if [ "$status" == "splunkd is not running." ]; then
    sudo ${SPLUNK_BIN} start --accept-license
    IP=$(ip addr show eth1 | awk '/inet / {print $2}' | cut -d '/' -f 1)
cowsay <<MOO
        Splunk is available: "${IP}:8000"
MOO
fi