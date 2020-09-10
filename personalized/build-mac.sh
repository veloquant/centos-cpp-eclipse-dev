#¡/bin/zsh
# Build a Docker image suitable for use on macOS.

DOCKERFILE=`dirname $0`/Dockerfile
docker build -f $DOCKERFILE --build-arg USERNAME=$USER --build-arg UID=`id -u` --build-arg GID=`id -g` --build-arg HOMEDIR_BASE=/Users --build-arg X_DISPLAY=docker.for.mac.localhost:0 --build-arg USER_HOME=${HOME} -t centos-dev-${USER} .
