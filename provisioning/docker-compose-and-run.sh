#!/usr/bin/env bash

export GIT_COMMIT=$1

docker-compose down
docker rmi $(docker images -q)
docker-compose up -d --build
