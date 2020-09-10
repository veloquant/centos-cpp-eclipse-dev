# CentOS CPP Eclipse Dev

This project defines a Docker image for C++ development on CentOS using G++ and Eclipse IDE,
It has been published to Docker Hub as *centos-cpp-eclipse-dev*

CentOS Dev Environment for C++ with G++ and Eclipse

The main Dockerfile builds a common Docker image with all the development tools. The *personalized*
directory contains a Dockerfile which creates a per-user environment with the username, home-directory
etc. as expected.
