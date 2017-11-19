#!/bin/bash

bash /fix_hosts.sh > /tmp/fixhosts 2>&1 &

if [ ${RUN} == "kafka" ]; then
    bash /kafka/run_kafka.sh
else
    bash /kafka/run_zookeeper.sh
fi
