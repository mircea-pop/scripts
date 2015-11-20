#!/bin/bash

kafkaDir=~/software/kafka


cd $kafkaDir
./bin/zookeeper-server-start.sh config/zookeeper.properties &> /dev/null &

if [ $(pgrep -f zookeeper | wc -l) -eq 1 ]
then echo "Started zookeeper"
else echo "Couldn't start zookeeper"
fi


./bin/kafka-server-start.sh config/server.properties &> /dev/null &

if [ $(pgrep -f zookeeper | wc -l) -eq 2 ]
then echo "Started kafka"
else echo "Couldn't start kafka"
fi


