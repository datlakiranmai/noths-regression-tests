#!/usr/bin/env bash

check_for_error() {
    exit_code=$1
    if [ "$exit_code" -gt 0 ]; then
        echo "Shuting Docker Compose down"
        docker-compose down
        exit 1
    fi
}

echo "Exporting Environment Variable"
export envid = $ENV_ID

echo "Build a test container"
docker-compose build tests

echo "Start all the containers"
docker-compose up -d

echo "Run the tests"
docker-compose run -e ENV_ID=$envid tests

check_for_error $?

echo "Shutting down all the Containers"
docker-compose down