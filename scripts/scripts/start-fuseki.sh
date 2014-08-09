#!/bin/bash
./populate-vocab.sh
cd /data/app/fuseki
./fuseki-server --config=/data/app/fuseki/config-tdb.ttl
#echo 'test'
#for (( ; ; ))
#do
#   echo "Pres CTRL+C to stop..."
#   sleep 1
#done
