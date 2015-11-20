#!/bin/bash

actual=$(cat /etc/hosts | grep mintaka)

if [ ${actual:0:1} == "#" ] ; then
 echo "Mapping disabled, reanabling it"
 sudo sed -i '/mintaka-test01.smaatolabs.net/c\127.0.0.1 mintaka-test01.smaatolabs.net' /etc/hosts
 sudo sed -i '/aerospike-test01.smaatolabs.net/c\127.0.0.1 aerospike-test01.smaatolabs.net' /etc/hosts
else
 echo "Mapping is enabled, disabling it"
 sudo sed -i '/mintaka-test01.smaatolabs.net/c\#127.0.0.1 mintaka-test01.smaatolabs.net' /etc/hosts
 sudo sed -i '/aerospike-test01.smaatolabs.net/c\#127.0.0.1 aerospike-test01.smaatolabs.net' /etc/hosts
fi
