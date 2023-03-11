#!/bin/bash

URL=http://localhost/ 
VIP=192.168.30.46
VIP_URL=http:/$VIP/

errorExit() {
   echo "*** $@" 1>&2
   exit 1
}

curl --silent --max-time 2 $URL -o /dev/null || errorExit "Error GET $URL"
if ip addr | grep -q $VIP; then
   curl --silent --max-time 2 $VIP_URL -o /dev/null || errorExit "Error GET $VIP_URL"
fi
