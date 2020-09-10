#!/bin/zsh
# Customize the Docker image built in the top-level directory
# and produce a custom one for use on macOS.

DOCKERFILE=`dirname $0`/Dockerfile
TAG=centos-dev:${USER}
HOMEDIR_BASE=/Users

docker build -f $DOCKERFILE \
    --build-arg USERNAME=$USER \
    --build-arg UID=`id -u` \
    --build-arg GID=`id -g` \
    --build-arg HOMEDIR_BASE=${HOMEDIR_BASE} \
    --build-arg X_DISPLAY=docker.for.mac.localhost:0 \
    --build-arg USER_HOME=${HOME} \
    -t $TAG `dirname $0`
docker run -it -v ${HOMEDIR_BASE}:${HOMEDIR_BASE} --hostname centos-cpp-dev $TAG
