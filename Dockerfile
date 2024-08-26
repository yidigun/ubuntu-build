ARG IMG_TAG=latest
FROM docker.io/yidigun/ubuntu-base:${IMG_TAG}

ARG IMG_NAME
ARG IMG_TAG

ENV IMG_NAME=$IMG_NAME
ENV IMG_TAG=$IMG_TAG

# Since 24.04 source.list format is changed
RUN sed -i -e '/deb-src/s/^#\s*//' /etc/apt/sources.list && \
    if [ -f /etc/apt/sources.list.d/ubuntu.sources ]; then \
        sed -i -e 's/^Types: deb$/Types: deb deb-src/' \
            /etc/apt/sources.list.d/ubuntu.sources; \
    fi; \
    apt-get -y update && \
    apt-get -y install dpkg-dev git && \
    apt-get clean
