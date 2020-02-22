#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven

docker run --rm -v /pipeline/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
