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

