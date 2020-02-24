#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
echo $PASSS
docker login -u chilv -p $PASSS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG chilv/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push chilv/$IMAGE:$BUILD_TAG
