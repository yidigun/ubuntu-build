ARG IMG_TAG
FROM docker.io/yidigun/ubuntu-base:${IMG_TAG}

ARG IMG_NAME
ARG IMG_TAG
ARG LANG=en_US.UTF-8
ARG TZ=UTC

ENV IMG_NAME=$IMG_NAME
ENV IMG_TAG=$IMG_TAG
ENV LANG=$LANG
ENV TZ=$TZ

RUN sed -i -e '/deb-src/s/^#\s*//' /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y install dpkg-dev && \
    apt-get clean

RUN locale-gen $LANG && \
    update-locale LANG=$LANG && \
    [ -n "$TZ" -a -f /usr/share/zoneinfo/$TZ ] && \
      ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
