#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i $WORKSPACE/pipeline/jenkins/deploy/key ./jenkins/deploy/docker-compose.yml prod-user@linuxfacilito.online:/tmp/docker-compose.yml
scp -i $WORKSPACE/pipeline/jenkins/deploy/key /tmp/.auth prod-user@linuxfacilito.online:/tmp/.auth
scp -i $WORKSPACE/pipeline/jenkins/deploy/key ./jenkins/deploy/publish prod-user@linuxfacilito.online:/tmp/publish
ssh -i $WORKSPACE/pipeline/jenkins/deploy/key prod-user@linuxfacilito.online "/tmp/publish"
