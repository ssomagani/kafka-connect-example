#!/bin/bash

trap "kill 0" EXIT

connect-standalone config/FRAUD-sink.properties config/mysql-sink-FRAUD.properties &

connect-standalone config/CARD_ALERT_EXPORT-sink.properties config/mysql-sink-CARD_ALERT_EXPORT.properties &

connect-standalone config/UPDATE_REQUESTS-sink.properties config/mysql-sink-UPDATE_REQUESTS.properties &

connect-standalone config/TRIPS-sink.properties config/mysql-sink-TRIPS.properties &

wait