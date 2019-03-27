FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /imagemagick

RUN set -ex && \
    sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
    buildDeps="git build-essential ca-certificates" && \
    apt-get update -yqq && \
    apt-get build-dep imagemagick -yqq && \
    apt-get install -yqq $buildDeps && \
    apt-get install -yqq libgomp1 libpng-dev libjpeg-dev && \
    git clone https://github.com/ImageMagick/ImageMagick.git && \
    cd ImageMagick && \
    git checkout 7.0.8-27 && \
    ./configure && \
    make && \
    make install && \
    apt-get purge --auto-remove -yqq $buildDeps && \
    apt-get autoremove -yqq --purge && \
    apt-get clean

ENTRYPOINT ["convert"]
