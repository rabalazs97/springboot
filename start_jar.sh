#!/bin/sh
nohup java -jar /home/cloud/onlab/onlab-0.0.1-SNAPSHOT.jar &
echo $! >> /home/cloud/onlab/onlab.pid
sleep 5