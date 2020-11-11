#!/bin/bash

cd /home/seetasomagani/fraud-detection
export SERVERS=voltdb; ./run.sh init
export SERVERS=voltdb; ./run.sh train