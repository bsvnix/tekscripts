#!/bin/bash
batstatus=$(cat /tmp/battery.txt | head -2 | tail -1)
batstatusprev=$(cat /tmp/batteryprev.txt | head -2 | tail -1)
gwmac=$(cat /etc/default/tektelic-bridge.toml | head -48 | tail -1)
batnotif=$"$gwmac  $batstatus"
if [[ "$batstatus" != "$batstatusprev" ]]
 then
  echo $batnotif >> /dev/tcp/10.7.7.137/1514 //change server and port according to your own
  cp /tmp/battery.txt /tmp/batteryprev.txt
fi
