FROM anapsix/alpine-java:8_jdk

# RUN=kafka or zookeeper

RUN mkdir -p /kafka/kafka
WORKDIR /kafka

ADD kafka_2.11-0.11.0.1 /kafka/kafka

ADD run_kafka.sh /kafka/run_kafka.sh
ADD run_zookeeper.sh /kafka/run_zookeeper.sh
ADD run.sh /kafka/run.sh

CMD ["/bin/bash", "-c", "/kafka/run.sh"]
