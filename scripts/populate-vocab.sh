FUSEKI_DATA_SERVICE=http://localhost:3030/ticks/data
ONTOLOGY_DIR=/data/ttl
VOCABULARY_GRAPH=https://data.linkeddata.com/ticks/data-graph

cd /data/app/fuseki

export PATH=$PATH:/usr/share/fuseki:/data/app/fuseki

echo starting the fuseki server
./fuseki-server --config=/data/app/fuseki/config-tdb.ttl &

echo waiting for server to start

sleep 10

if ! [ -a /data/scripts/fuseki ]
then

    # load the vocabulary files
    s-delete ${FUSEKI_DATA_SERVICE} ${VOCABULARY_GRAPH}
    for file in ${ONTOLOGY_DIR}/*
    do
        echo installing ontology file $file
        s-post ${FUSEKI_DATA_SERVICE} ${VOCABULARY_GRAPH} $file
    done
touch /data/scripts/fuseki
fi

killall java
