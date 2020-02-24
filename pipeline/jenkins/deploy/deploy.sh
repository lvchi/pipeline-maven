#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

chmod 400 /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key
scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key ./pipeline/jenkins/deploy/docker-compose.yml prod-user@10.130.9.11:/tmp/docker-compose.yml
scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key /tmp/.auth prod-user@10.130.9.11:/tmp/.auth
scp -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key ./pipeline/jenkins/deploy/publish prod-user@10.130.9.11:/tmp/publish
ssh -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key prod-user@10.130.9.11 "chmod +x /tmp/publish"
ssh -i /var/jenkins_home/workspace/pipeline-docker-maven/pipeline/jenkins/deploy/key prod-user@10.130.9.11 "/tmp/publish"