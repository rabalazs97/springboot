#!/bin/sh
nohup java -jar /home/cloud/onlab/onlab-0.0.1-SNAPSHOT.jar > /dev/null 2>&1 &
echo $! >> /home/cloud/onlab/onlab.pid