#!/bin/sh
if apid=$(pgrep -f onlab-0.0.1-SNAPSHOT.jar)
then
    echo "Running, pid is $apid"
    sudo kill $apid
else
    echo "Stopped"
fi