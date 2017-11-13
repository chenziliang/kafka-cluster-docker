#!/bin/bash

if [ ${RUN} == "kafka" ]; then
    bash /kafka/run_kafka.sh
else
    bash /kafka/run_zookeeper.sh
fi
