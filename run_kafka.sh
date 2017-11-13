#!/bin/bash

# Key environment varaibles
# KAFKA_BROKER_ID
# KAFKA_LISTENERS
# KAFKA_ADVERTISED_LISTENERS
# KAFKA_LOG_DIRS
# KAFKA_NUM_PARTITIONS
# KAFKA_ZOOKEEPER_CONNECT
# ...

cd kafka

for envvar in `env | grep ^KAFKA_ | grep -v KAFKA_HEAP_OPTS`
do
    setting=`echo "${envvar}" | tr [:upper:] [:lower:] | sed "s#^kafka_##g; s#_#.#g"`
    set -- `echo ${setting} | tr '=' ' '`
    key="$1"
    value="$2"

    res=`grep ${key} config/server.properties`
    if [ "${res}" != ""  ]; then
        sed -E -i"" "s@^#?${key}.*@${key}=${value}@g" config/server.properties
    else
        echo ${setting} >> config/server.properties
    fi

done

sleep 5

./bin/kafka-server-start.sh config/server.properties
