# INSTRUCTIONS

## Create Topic
docker exec -it kafka /bin/bash

opt/kafka/bin/kafka-topics.sh --bootstrap-server=kafka:9092 --create --topic=asdf

## Create Publisher

docker exec -it producer /bin/bash

opt/kafka/bin/kafka-console-producer.sh --bootstrap-server=kafka:9092 --topic=asdf

## Create Connect Sink
docker exec -it connect /bin/bash

connect-standalone config/connect-standalone-sink.properties config/file-sink-standalone.properties

connect-distributed config/connect-distributed-sink.properties 

curl localhost:28083/connectors

curl -X POST -H "Content-Type: application/json" -d @config/file-sink-distributed.json localhost:28083

## Test Sink
docker exec -it connect /bin/bash

tail -f /data/asdf.json




####CONNECT
Caused by: org.apache.kafka.common.errors.SerializationException: Error retrieving Avro value schema version for id 2
Caused by: io.confluent.kafka.schemaregistry.client.rest.exceptions.RestClientException: Subject 'avrostream-value' not found.; error code: 40401

####Schema Registry
schemaregistry_1  | io.confluent.rest.exceptions.RestNotFoundException: Subject 'avrostream-value' not found.

#####Volt
create opaque topic avrostream-value;
[Ad Hoc DDL Input]: VoltDB DDL Error: "Invalid CREATE OPAQUE TOPIC statement: "create opaque topic avrostream-value", expected syntax: "CREATE OPAQUE TOPIC {name} [PARTITIONED] [ALLOW [PRODUCER | CONSUMER] {roles}] [PROFILE {profile}]""




