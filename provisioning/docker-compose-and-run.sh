#!/usr/bin/env bash

export GIT_COMMIT=$(git rev-parse HEAD)

docker-compose down
docker-compose up -d --build
