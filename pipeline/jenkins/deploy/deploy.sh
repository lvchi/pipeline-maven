#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key ./jenkins/deploy/docker-compose.yml prod-user@10.130.9.253:/tmp/docker-compose.yml
scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key /tmp/.auth prod-user@10.130.9.253:/tmp/.auth
scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key ./jenkins/deploy/publish prod-user@10.130.9.253:/tmp/publish
ssh -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key prod-user@10.130.9.253 "/tmp/publish"
