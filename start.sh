#!/bin/bash

if [ ! -e /data/eula.txt ]; then
    echo "# Generated via Docker on $(date)" > eula.txt
    echo "eula=$EULA" >> eula.txt
fi

MC_ARGS="nogui -o true"
JAVA_ARGS="-d64 $JAVA_OPTS -jar /minecraft_server.$MC_VERSION.jar"

echo "Java params: $JAVA_ARGS"
echo "Minecraft params: $MC_ARGS"

java $JAVA_ARGS $MC_ARGS
