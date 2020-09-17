ARG CENTOS_VERSION=7

FROM centos:${CENTOS_VERSION}

RUN yum update -y && \
    yum group install -y "Development Tools" && \
    yum install -y sudo python3 && \
    yum group install -y "GNOME Desktop" && \
    yum clean -y all

ARG ECLIPSE_VERSION=2020-06

# Use a release build.
ARG ECLIPSE_BUILD=R

# Customize this if another mirror works better for you
ARG ECLIPSE_DOWNLOAD_BASE=http://mirror.dkm.cz/eclipse/technology/epp/downloads/release/

WORKDIR /opt
RUN curl -L $ECLIPSE_DOWNLOAD_URL ${ECLIPSE_DOWNLOAD_BASE}${ECLIPSE_VERSION}/${ECLIPSE_BUILD}/eclipse-cpp-${ECLIPSE_VERSION}-${ECLIPSE_BUILD}-linux-gtk-x86_64.tar.gz | tar xfz -
ENV PATH $PATH:/opt/eclipse

WORKDIR /root

ARG CENTOS_VERSION
LABEL org.centos.version ${CENTOS_VERSION}
LABEL org.eclipse.version ${ECLIPSE_VERSION}
LABEL org.eclipse.build ${ECLIPSE_BUILD}
