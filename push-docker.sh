#!/bin/bash

TAGV=0.1
if [[ -n $1 ]]; then
    TAGV=$1
fi

docker tag attap0n/tljh-systemd:latest attap0n/tljh-systemd:$TAGV

echo "Push Docker Image: attap0n/tljh-systemd:$TAGV"
docker push attap0n/tljh-systemd:$TAGV

echo "Push Docker Image: attap0n/tljh-systemd:latest"
docker push attap0n/tljh-systemd:latest