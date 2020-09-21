#INSTRUCTIONS

Create Topic
opt/kafka/bin/kafka-topics.sh --bootstrap-server=localhost:9092 --create --topic=asdf

Publish to Topic
opt/kafka/bin/kafka-console-producer.sh --bootstrap-server=localhost:9092 --topic=asdf

Consume Topic
opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server=localhost:9092 --topic=asdf
