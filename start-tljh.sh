#!/bin/bash
docker-compose up -d

AUTH_ADMIN=admin:admin
if [[ -n $1 ]]; then
    AUTH_ADMIN=$1
fi
echo "Create User: $AUTH_ADMIN"
docker-compose exec tljh bash -c \
    "curl -L https://tljh.jupyter.org/bootstrap.py \
    | sudo python3 - --show-progress-page --admin $AUTH_ADMIN"
