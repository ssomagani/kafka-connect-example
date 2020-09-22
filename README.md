# INSTRUCTIONS

## Create Topic
docker exec -it kafka /bin/bash
opt/kafka/bin/kafka-topics.sh --bootstrap-server=kafka:9092 --create --topic=asdf

## Create Publisher
docker exec -it publisher /bin/bash
opt/kafka/bin/kafka-console-producer.sh --bootstrap-server=kafka:9092 --topic=asdf

## Create Consumer
docker exec -it consumer /bin/bash
opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server=kafka:9092 --topic=asdf
