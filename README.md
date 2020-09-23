# INSTRUCTIONS

## Create Topic
docker exec -it kafka /bin/bash

opt/kafka/bin/kafka-topics.sh --bootstrap-server=kafka:9092 --create --topic=asdf

## Create Publisher

javac -cp /Users/seetasomagani/distributions/kafka_2.12-2.5.0/libs/kafka_2.12-2.5.0.jar:/Users/seetasomagani/distributions/kafka_2.12-2.5.0/libs/kafka-clients-2.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/kafka-avro-serializer-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/kafka-schema-serializer-5.5.0.jar:. AvroProducer.java

java -cp /Users/seetasomagani/distributions/kafka_2.12-2.5.0/libs/kafka_2.12-2.5.0.jar:/Users/seetasomagani/distributions/kafka_2.12-2.5.0/libs/kafka-clients-2.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/kafka-avro-serializer-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/kafka-schema-serializer-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/slf4j-api-1.7.26.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/kafka-schema-registry-client-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/common-config-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/avro-1.9.2.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/common-utils-5.5.0.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/jackson-core-2.10.2.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/jackson-databind-2.10.2.jar:/Users/seetasomagani/distributions/confluent-5.5.1/share/confluent-hub-components/confluentinc-kafka-connect-datagen/lib/jackson-annotations-2.10.2.jar:. AvroProducer

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

