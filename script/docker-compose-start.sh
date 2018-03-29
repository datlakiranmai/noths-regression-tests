#!/usr/bin/env bash

check_for_error() {
    exit_code=$?
    if [ $exit_code -gt 0 ]; then
        echo "Shuting Docker Compose down"
        docker-compose down
        exit 1
    fi
}

echo "Exporting Environment Variable"
export ENV_ID=$ENV_ID
export TESTS_COMMAND=$TESTS_COMMAND

echo "Build a test container"
docker-compose build tests

echo "Start all the containers"
docker-compose up -d

echo "Run the tests"
docker-compose run -e ENV_ID="$ENV_ID" tests

check_for_error $?

echo "Shutting down all the Containers"
docker-compose down