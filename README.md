# INSTRUCTIONS

## Init Volt
sqlcmd < init.ddl

CREATE STREAM FRAUD partition on column CARD_ID (
  TRANS_ID varchar not null,
  CARD_ID integer not null,
  DATE_TIME timestamp not null,
  STATION integer not null,
  ACTIVITY_TYPE TINYINT not null,
  AMT integer not null
);
create topic using stream FRAUD PROPERTIES (topic.format=avro,consumer.keys=TRANS_ID);

insert into FRAUD values ('9999', 1, NOW, 2, 3, 4);

## Start MySQL Connector
##connect-standalone /config/connect-standalone-sink.properties /config/mysql-sink-standalone.properties 

connect-standalone connect-config/fraud-sink.properties connect-config/mysql-sink-FRAUD.properties

# Issues

1. F Workload runs only for 15s
2. F Parameterize requests per seconds
3. F Create Volt cluster
4. Primary key exceptions on TRIPS records
5. No records written out to UPDATE_REQUESTS and CARD_ALERT_EXPORT
6. F Only one TRAIN_ACTIVITY recorded
7. TRIPs are too short

# Pending Features

1. Graphic UI (Prometheus) to demonstrate the speed of transfer of data from Volt to MySQL
2. Separation of server and client runtimes
3. Producer API utilization


# ECS Running Instructions
1. docker compose -f docker-compose-ecs.yml up
2. aws ecs list-tasks --cluster=kafkaconnectexample
3. aws ecs describe-tasks --task=5aa7fae2a9a442c9bc9fcfef313655f2 --cluster=kafkaconnectexample
4. aws ec2 describe-network-interfaces --network-interface-ids eni-081c3aedaab310813
5. mysql --host=107.20.60.231 --user=user --password=password

