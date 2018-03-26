#!/usr/bin/env bash

error_check() {
    exit_code=$1
    if [ "$exit_code" -gt 0 ]; then
        echo "Something when wrong!!"
        echo "Shuting down Docker Compose down"
        docker_compose down
        exit 1
    fi
}

echo "Exporting Env ID variable"
export ENVID = $ENV_ID

echo "Starting docker containers"
docker-compose run -e ENV_ID = $ENVID tests

error_check $?

echo "Shutting down all the Containers"
docker-compose down