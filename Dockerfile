FROM ubuntu:22.04

# install build toolchain
RUN apt-get update && apt-get install -y build-essential cmake libssl-dev vim git autoconf automake libtool m4 curl zip nodejs python3 python3-pip python3-requests libpsl-dev locales git-restore-mtime patch && apt-get clean

RUN pip install jsonschema ninja2 python-mbedtls 

# This is here for use in a devcontainer with CodeSonar in VS Code.
#RUN useradd -ms /bin/bash user

#fix locale warnings
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN groupadd --gid 1002 user\
    && useradd --uid 1002 --gid 1002 -m user

RUN mkdir /__w && chown user:user /__w    
RUN chown user:user /opt

USER user
