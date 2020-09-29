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
create topic using stream FRAUD format avro keys TRANS_ID;


## Start MySQL Connector
connect-standalone /config/connect-standalone-sink.properties /config/mysql-sink-standalone.properties 


