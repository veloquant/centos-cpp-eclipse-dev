#!/bin/bash
# Customize the Docker image built in the top-level directory
# This is an example of how it can be used on Linux.

DOCKERFILE=`dirname $0`/Dockerfile
TAG=centos-dev:${USER}
HOMEDIR_BASE=/`echo $HOME | cut -d/ -f2`

docker build -f $DOCKERFILE \
    --build-arg USERNAME=$USER \
    --build-arg UID=`id -u` \
    --build-arg GID=`id -g` \
    --build-arg HOMEDIR_BASE=${HOMEDIR_BASE} \
    --build-arg X_DISPLAY=${DISPLAY} \
    --build-arg USER_HOME=${HOME} \
    -t $TAG `dirname $0`
docker run -it -v ${HOMEDIR_BASE}:${HOMEDIR_BASE} --network host --hostname centos-cpp-dev $TAG
