#!/bin/bash

if [ $(pgrep -f zookeeper | wc -l) -eq 0 ]
then  echo "Zookeeper and Kafka are not running"
      exit;
fi


pkill -9 -f zookeeper

if [ $(pgrep -f zookeeper | wc -l) -eq 0 ]
then  echo "Zookeeper and Kafka killed successfully"
else echo "Couldn't successfully kill Zookeeper and Kafka"
fi
