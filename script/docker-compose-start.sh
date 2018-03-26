#!/usr/bin/env bash

error_check() {
    exit_code=$1
    if [ "$exit_code" -gt 0 ]; then
        echo "Shutting down!!"
        echo "Shuting Docker Compose down"
        docker-compose down
        exit 1
    fi
}

echo "Build a test container"
docker-compose build tests

echo "Start all the containers"
docker-compose up -d

echo "Run the tests"
docker-compose run tests

error_check $?

echo "Shutting down all the Containers"
docker-compose down