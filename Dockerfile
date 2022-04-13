ARG IMG_TAG
FROM docker.io/yidigun/ubuntu-base:${IMG_TAG}

ARG IMG_NAME
ARG IMG_TAG

ENV IMG_NAME=$IMG_NAME
ENV IMG_TAG=$IMG_TAG

RUN sed -i -e '/deb-src/s/^#\s*//' /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y install dpkg-dev && \
    apt-get clean
