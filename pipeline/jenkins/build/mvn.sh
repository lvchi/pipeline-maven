#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"


WORKSPACE=/home/jenkins/pipeline-maven/jenkins_home/workspace/pipeline-docker-maven

docker run --rm -v $WORKSPACE/pipeline/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
