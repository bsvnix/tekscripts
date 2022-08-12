#!/bin/bash
#getting current power source
batstatus=$(cat /tmp/battery.txt | head -2 | tail -1)
batstatusprev=$(cat /tmp/batteryprev.txt 2> /dev/null | head -2 | tail -1)
gwmac=$(cat /etc/default/tektelic-bridge.toml | head -48 | tail -1)
batnotif=$"$gwmac  $batstatus"
if [[ "$batstatus" != "$batstatusprev" ]]
 then
 #IP and port should be changed to your syslog server IP and port, if you want to sent UDP just change “tcp” to “udp” in next line
  echo $batnotif >> /dev/tcp/10.7.7.137/1514
  cp /tmp/battery.txt /tmp/batteryprev.txt
fi
